//
//  ViewController.swift
//  LiveEPG
//
//  Created by Sweda Thiyagarajan on 21/08/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var carousalScrollView : UIScrollView?
    
    
    @IBOutlet var categoryScrollView : UIScrollView?
    
    
    @IBOutlet var timeScrollView : UIScrollView?
    
    
    @IBOutlet var channelLogoScrollView : UIScrollView?
    
    
    @IBOutlet var pgmScrollView : UIScrollView?

    override func viewDidLoad() {
        super.viewDidLoad()
        activateLoadingIndicator()
        sendRequest()
        // Do any additional setup after loading the view.
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

}

