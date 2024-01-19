//
//  ViewController.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 11/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var parentCarousalView : UIView!
    @IBOutlet var carousalScrollView : UIScrollView!
    
    @IBOutlet var parentCategoryView : UIView!
    @IBOutlet var categoryScrollView : UIScrollView!
    
    @IBOutlet var parentTimestampView : UIView!
    @IBOutlet var timstampScrollView : UIScrollView!
    
    @IBOutlet var parentChannelView : UIView!
    @IBOutlet var channelScrollView : UIScrollView!
    
    @IBOutlet var parentProgramView : UIView!
    @IBOutlet var programScrollView : UIScrollView!
    
    @IBOutlet var expandCollapseBtn : FocusTvButton!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var dateListButton : FocusTvButton!
    @IBOutlet var dateTitleLabel: UILabel!
    
    @IBOutlet var liveIndicatorView : UIView!
    @IBOutlet weak var liveLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet var dateListView : UITableView!
    
    @IBOutlet var topToCarousalConstraint : NSLayoutConstraint!
    @IBOutlet var topToCategoryConstraint : NSLayoutConstraint!
    
    private var isScrolledHorizontally:Bool = false
    private var isScrolledVertically:Bool = false
    
    private var lastXOffset:CGFloat = 0.0
    private var lastYOffset:CGFloat = 0.0
    private var xPosForLiveIndicator : CGFloat = 0
    
    var carousalData = [CarousalModel]()
    var categoryViewCollection = [CategoryListView]()
    var categoryListModel = [CategoryListModel]()
    var channelModel = [ChannelModel]()
    var dateModelCollection = [DateModel]()
    var refreshCarousalUrl : String = ""
    var overlayView : UIView?
    var activityIndicator : UIActivityIndicatorView?
    var epgWidget : EpgWidget?
    var timer : Timer?
    var todayEpgUrl : String? = ""
    var isdateListHidden : Bool = true
    var dateParam : String = ""
    var categoryParam : String = ""
    var timeStampInterval : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func setupLayout() {
        setScrollWidth()
        liveIndicatorView?.isHidden = true
        dateListView?.isHidden = true
        
        programScrollView?.delegate = self
        channelScrollView?.delegate = self
        timstampScrollView?.delegate = self
        dateListView?.delegate = self
        dateListView?.dataSource = self
        timstampScrollView?.contentSize.width = self.view.frame.size.width
        carousalScrollView?.contentSize.width = self.view.frame.size.width
        
        expandCollapseBtn?.normalBackgroundColor = .black
        expandCollapseBtn?.focusedBackgroundColor = .systemPurple
        expandCollapseBtn?.focusedBackgroundEndColor = .purple
        expandCollapseBtn?.cornerRadius = 10
        
        dateListButton?.normalBackgroundColor = .black
        dateListButton?.focusedBackgroundColor = .systemPurple
        dateListButton?.focusedBackgroundEndColor = .purple
        dateListButton?.cornerRadius = 10
        dateTitleLabel?.textColor = .white
        dateTitleLabel?.text = "Today"
        dateTitleLabel?.font = UIFont.systemFont(ofSize: 20)
        
        registerTableViewCells()
        activateLoadingIndicator()
        sendRequest()
        
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(xPosOfLiveIndicator), userInfo: nil, repeats: true)
    }
    
    func activateLoadingIndicator () {
        overlayView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height))
        overlayView?.backgroundColor = .black
        overlayView?.alpha = 0.75
        
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        activityIndicator?.center = overlayView?.center ?? self.view.center
        activityIndicator?.alpha = 1
        activityIndicator?.style = .large
        activityIndicator?.color = .systemPurple
        activityIndicator?.startAnimating()
        
        if let activityIndicator = activityIndicator {
            overlayView?.addSubview(activityIndicator)
        }
        
        if let overlayView = overlayView {
            self.view.addSubview(overlayView)
        }
    }
    
    func stopLoadingIndicator () {
        DispatchQueue.main.async {
            self.activityIndicator?.stopAnimating()
            self.activityIndicator?.removeFromSuperview()
            self.overlayView?.removeFromSuperview()
        }
    }

    func setScrollWidth () {
        let maxWidth = PgmViewDimensions.oneMinuteWidth * (24*60)
        timstampScrollView?.contentSize.width = maxWidth
        programScrollView?.contentSize.width = maxWidth
    }
    
    func sendRequest() {
        
        let url = URL(string: "https://qaottapi.ventunotech.com/v1/ott/live/619882e0e2322/672?url=http://54.71.223.104/livetv")!
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                // Handle HTTP request error
                print ("error: \(error)")
            } else if let data = data {
                // Handle HTTP request response
                self.parseResponse(responseData: data)
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
        
    }
    
    func parseResponse (responseData : Data) {
        
        stopLoadingIndicator()
        
        let parsedJson = JsonObj(responseData)
        let widgets  = parsedJson.getWidgets(parsedJson: parsedJson)
        
        DispatchQueue.main.async {
            if let carousalScrollView = self.carousalScrollView {
                for subView in carousalScrollView.subviews {
                    if subView is CarousalView {
                        subView.removeFromSuperview()
                    }
                }
            }
        }
            
        for widget in widgets {
            if let node = widget as? [String:AnyObject] {
                let widgetObj:Widget = Widget(JsonObj(node))
                let widgetType = widgetObj.getType()
                if widgetType == ApiKey.__KEY_HYBRID_CAROUSAL {
                    parseCarousalWidget(carousalWidget: widgetObj)
                } else if widgetType == ApiKey.TYPE_EPG_WIDGET_V2 {
                    epgWidget = EpgWidget(JsonObj(node))
                    let options = epgWidget?.getOptions()
                    if let options = options {
                        for thisOption in options {
                            let categoryModel = CategoryListModel()
                            categoryModel.label = thisOption.getLabel()
                            categoryModel.categoryId = thisOption.getCategoryId()
                            categoryListModel.append(categoryModel)
                            loadCategoryViewWith(model: categoryModel)
                            
                            if thisOption.getLabel().lowercased() == ApiKey.__KEY_RECOMMENDED.lowercased() {
                                categoryParam = thisOption.getCategoryId()
                            }
                        }
                    }
                    DispatchQueue.main.async {
                        self.expandCollapseBtn.setTitle(self.epgWidget?.getExpandLabel(), for: .normal)
                    }
                    
                    guard let secondaryOptions = epgWidget?.getSecondaryOptions() else {
                        return
                    }
                    var xForDate:CGFloat = 0
                    for option in secondaryOptions {
                        print ("option: \(option.getPrimaryLbl())")
                        let dateModel = DateModel()
                        dateModel.primaryLabel = option.getPrimaryLbl()
                        dateModel.secondaryLabel = option.getSecondaryLbl()
                        dateModel.value = option.getValue()
                        dateModel.urlStr = option.getUrl()
                        dateModel.dateParam = option.getDateParam()
                        dateModelCollection.append(dateModel)
                        
                        if option.getSecondaryLbl().lowercased() == ApiKey.__KEY_TODAY.lowercased() {
                            dateParam = dateModel.dateParam
                        }
                    }
                   
                    timeStampInterval = Int(epgWidget?.getTimelineInterval() ?? 0)
                    let timeStamps = Date().getIntervals(withMinutes: timeStampInterval)
                    let width = calculateTimeWidth(time: CGFloat(timeStampInterval))

                    let timeStampModel = TimestampModel()
                    
                    for time in timeStamps {
                        let timeStampModel = TimestampModel()
                        timeStampModel.time = time
                        loadTimestampViewWith(model: timeStampModel, width : width)
                    }
                    
                    todayEpgUrl = epgWidget?.getTodayURL()
                    print ("getTodayURL : \(epgWidget?.getTodayURL())")
                    
                    if let todayUrl = todayEpgUrl {
                        sendLiveEPGRequest(urlStr: todayUrl)
                    }
                }
            }
        }
    }
    
    func sendLiveEPGRequest(urlStr todayUrl: String) {
        let url = URL(string: todayUrl)
        if let url = url {
            let request = URLRequest(url: url)
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in

                if let error = error {
                    // Handle HTTP request error
                    print ("error: \(error)")
                } else if let data = data {
                    // Handle HTTP request response
                    let mPageData = PageData(JsonObj(data).optJsonObj(PageData.__KEY_RESPONSE))
                    self.parseEpgResponse(dateReceived: mPageData)
                } else {
                    // Handle unexpected error
                }
            }
            task.resume()
        }
    }
    
    func parseEpgResponse(dateReceived response : PageData) {
        let mJsonRaw:[JsonObj] = UtilPageData.getEpgCardV2Widgets(response)
        var x : CGFloat = 0
        var y : CGFloat = 0
        
        DispatchQueue.main.async {
            for subView in self.programScrollView.subviews {
                let pgmView = subView as? ProgramView
                if let pgmView = pgmView {
                    pgmView.removeFromSuperview()
                }
            }
            
            for subView in self.channelScrollView.subviews {
                let channelView = subView as? ChannelView
                if let channelView = channelView {
                    ChannelViewModel.y = 0
                    channelView.removeFromSuperview()
                }
            }
        }
        
        for jsonObj in mJsonRaw {
            let channelModel = ChannelModel()
            channelModel.title = jsonObj.optString(ApiKey.__KEY_TITLE)
            channelModel.thumbnail = UtilNode.getThumbnail_r1x1_w150(jsonObj)
            loadChannelView(model : channelModel)
            
            let cards = jsonObj.optJsonArray(ApiKey.__KEY_CARDS)
            
            for pgm in cards {
                if let pgmObj = pgm as? [String:AnyObject] {
                    let epgTab = EpgTab(JsonObj(pgmObj))
                    let pgmModel = ProgramModel()
                    pgmModel.title = epgTab.getTitle()
                    pgmModel.interval = epgTab.getInterval().getFormattedText()
                    pgmModel.startValueStr = epgTab.getInterval().startValueAsString()
                    pgmModel.endValueStr = epgTab.getInterval().endValueAsString()
                    
                    let width : CGFloat = calculateWidth(startTime: pgmModel.startValue, endTime: pgmModel.endValue)
                    
                    loadPgmView(x : x, y : y, width : width, model: pgmModel)
                    x += width + 10
                }
            }
            x = 0
            y += PgmViewDimensions.height + 10
            DispatchQueue.main.async {
                self.programScrollView.contentSize.height += PgmViewDimensions.height + 10
            }
        }
        findCurrentShow()
    }
    
    func sendCarousalRefreshRequest() {
        
        let url = URL(string: refreshCarousalUrl)
        if let url = url {
            let request = URLRequest(url: url)
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    // Handle HTTP request error
                    print ("error: \(error)")
                } else if let data = data {
                    // Handle HTTP request response
                    self.parseCarousalResponse(responseData: data)
                } else {
                    // Handle unexpected error
                }
            }
            task.resume()
        }
    }
    
    func parseCarousalResponse(responseData: Data) {
        let parsedJson = JsonObj(responseData)
        let widgets  = parsedJson.getWidgets(parsedJson: parsedJson)
        
        DispatchQueue.main.async {
            for subView in self.carousalScrollView.subviews {
                if subView is CarousalView {
                    subView.removeFromSuperview()
                }
            }
        }
            
        for widget in widgets {
            if let node = widget as? [String:AnyObject] {
                let widgetObj:Widget = Widget(JsonObj(node))
                let widgetType = widgetObj.getType()
                if widgetType == ApiKey.__KEY_HYBRID_CAROUSAL {
                    parseCarousalWidget(carousalWidget: widgetObj)
                }
            }
        }
    }
    
    func parseCarousalWidget(carousalWidget : Widget) {
        setCarousalScrollWidth(carousalCount: carousalWidget.getCards().count)
        for cardObj in carousalWidget.getCards() {
            if let cardObj = cardObj as? [String:AnyObject] {
                let card = CardData(JsonObj(cardObj))
                let carousalModel = CarousalModel()
                carousalModel.overline = card.getTitle()
                carousalModel.description = card.getDescription()
                carousalModel.title = card.getSubTitle()
                carousalModel.subtitle = card.getOverline()
                carousalModel.thumbnail = card.getImageUrl()
                carousalModel.overlineIcon = card.getOverlineImageUrl()
                carousalModel.totalDuration = card.getDurationValue()
                carousalModel.elapsedTime = card.getElapsedTime()
                carousalModel.durationInMinsStr = card.getDurationInMinsStr()
                loadCarousalViewWith (model: carousalModel)
                carousalData.append(carousalModel)
            }
        }
        refreshCarousalUrl = carousalWidget.getRefreshUrl()
    }
    
    func loadCategoryViewWith(model : CategoryListModel) {
        let categoryVM = CategoryListViewModel()
        categoryVM.parentController = self
        categoryVM.loadCategoryView(category: model)
        
        if let categoryView = categoryVM.categoryView {
            self.categoryViewCollection.append(categoryView)
        }
    }
    
    func loadCarousalViewWith(model : CarousalModel) {
        let carousalVM = CarousalViewModel()
        carousalVM.parentController = self
        carousalVM.loadCarousalView(carousalModel: model)
    }
    
    func loadDateView(x: CGFloat, model: DateModel) {
        let dateListVM = DateListViewModel()
        dateListVM.parentController = self
        dateListVM.loadDateListView(x: x, dateModel: model)
    }
    
    func loadTimestampViewWith(model : TimestampModel, width : CGFloat) {
        let timestampVM = TimestampViewModel()
        timestampVM.parentController = self
        timestampVM.loadTimestampView(interval: model, width: width)
    }
    
    func loadChannelView(model : ChannelModel) {
        let channelVM = ChannelViewModel()
        channelVM.parentController = self
        channelVM.loadChannelView(channel: model)
    }
    
    func loadPgmView(x : CGFloat, y : CGFloat, width : CGFloat, model : ProgramModel) {
        let pgmVM = ProgramViewModel()
        pgmVM.parentController = self
        pgmVM.loadProgramView(x : x, y : y, width: width, pgm: model)
    }
    
    func calculateWidth(startTime : Double, endTime : Double) -> CGFloat {
        var width : CGFloat = 0
        let intervalInSeconds = endTime - startTime
        let minuteInterval = (intervalInSeconds / 60)
        
        var filler = (Int(minuteInterval) / Int(timeStampInterval))
        let remainingFiller = (Int(minuteInterval) % Int(timeStampInterval))
        if remainingFiller > 0 {
            filler *= 10
        } else {
            filler -= 1
            filler *= 10
        }
        width = (minuteInterval * PgmViewDimensions.oneMinuteWidth) + Double(filler)
        
        return width
    }
    
    func calculateTimeWidth(time : CGFloat) -> CGFloat {
        var width : CGFloat = 0
        
        width =  time * PgmViewDimensions.oneMinuteWidth
        return width
    }
    
    func setCarousalScrollWidth(carousalCount : Int) {
        DispatchQueue.main.async {
            self.carousalScrollView?.contentSize.width = (CGFloat(carousalCount) * (CarousalDimensions.width))
        }
    }
    
    func findCurrentShow () {
        let  currentTime = Date().timeIntervalSince1970
        let date = Date()
        let dayStart = date.startOfDay
        let oneMinute = 60.0
        var secondsGone = 0.0
        var minutesGone = 0.0
        
        if currentTime > dayStart {
            secondsGone = currentTime - dayStart
        }
        
        if secondsGone > oneMinute {
            minutesGone = secondsGone/oneMinute
        }
        var filler = (Int(minutesGone) / timeStampInterval)
        let remainingFiller = (Int(minutesGone) % Int(timeStampInterval))
        if remainingFiller > 0 {
            filler *= 10
        } else {
            filler -= 1
            filler *= 10
        }
        xPosForLiveIndicator = (minutesGone * PgmViewDimensions.oneMinuteWidth) + Double(filler)
        DispatchQueue.main.async { [self] in
            self.liveLeadingConstraint?.constant = round(self.xPosForLiveIndicator)
            liveIndicatorView.isHidden = false
        }

    }
    
    @objc func xPosOfLiveIndicator () {
        DispatchQueue.main.async { [self] in
            self.liveLeadingConstraint?.constant += 13
        }
    }
}

extension ViewController {
    @IBAction func expandCollapseToggle (sender : UIButton) {
        if self.titleLabel.text == epgWidget?.getExpandLabel() {
            self.titleLabel.text = epgWidget?.getCollapseLabel()
            topToCarousalConstraint.constant = 10
            topToCategoryConstraint.isActive = false
            parentCarousalView.isHidden = true
        } else if self.titleLabel.text == epgWidget?.getCollapseLabel() {
            self.titleLabel.text = epgWidget?.getExpandLabel()
            topToCarousalConstraint.constant = 350
            topToCategoryConstraint.isActive = true
            parentCarousalView.isHidden = false
        }
    }
    
    @IBAction func displayDateView (sender : UIButton) {
//        if isdateListHidden {
            dateListView.isHidden = !isdateListHidden
        isdateListHidden = !isdateListHidden
        dateListView.reloadData()
//        }
    }
    
    func updateEpgData () {
        guard let todayEpgUrl = todayEpgUrl else {
            return
        }

        let url = URL(string: "\(todayEpgUrl)?category_id=\(categoryParam)&date=\(dateParam)")!
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                // Handle HTTP request error
                print ("error: \(error)")
            } else if let data = data {
                // Handle HTTP request response
                let mPageData = PageData(JsonObj(data).optJsonObj(PageData.__KEY_RESPONSE))
                self.parseEpgResponse(dateReceived: mPageData)
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
    }

}

extension ViewController : UIScrollViewDelegate {
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
         
         if scrollView == programScrollView {
             if lastYOffset != scrollView.contentOffset.y {
                 isScrolledHorizontally = false
                 isScrolledVertically = true
                 channelScrollView.contentOffset.y = programScrollView.contentOffset.y
             }
             
             if lastXOffset != programScrollView.contentOffset.x {
                 isScrolledHorizontally = true
                 isScrolledVertically = false
                 timstampScrollView.contentOffset.x = programScrollView.contentOffset.x
             }
         } else if scrollView == channelScrollView {
             programScrollView.contentOffset.y = channelScrollView.contentOffset.y
         }
         
         self.lastXOffset = scrollView.contentOffset.x
         self.lastYOffset = scrollView.contentOffset.y
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateModelCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "dateView") as? DateView {
            cell.parentController = self
            cell.dateBtn.setTitle(dateModelCollection[indexPath.row].primaryLabel, for: .normal)
            cell.dateBtn?.normalBackgroundColor = .black
            cell.dateBtn?.focusedBackgroundColor = .systemPurple
            cell.dateBtn?.focusedBackgroundEndColor = .purple
            cell.focusStyle = .default
            cell.contentView.backgroundColor = .systemPurple
//            cell.b
            cell.dateLabel.text = dateModelCollection[indexPath.row].primaryLabel
               return cell
           }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dateListView.isHidden = !isdateListHidden
        isdateListHidden = !isdateListHidden

        dateParam = dateModelCollection[indexPath.row].dateParam
        dateTitleLabel.text = dateModelCollection[indexPath.row].primaryLabel
        
        updateEpgData()
    }
    
    
    private func registerTableViewCells() {
        let dateCell = UINib(nibName: "DateView",
                                  bundle: nil)
        self.dateListView?.register(dateCell,
                                forCellReuseIdentifier: "dateView")
    }
    
}
