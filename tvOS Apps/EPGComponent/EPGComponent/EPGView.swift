//
//  EPGView.swift
//  EPGComponent
//
//  Created by Sweda Thiyagarajan on 22/06/2022.
//

import UIKit

class EPGView: UIView {
    
    static let KEY_PGM_NAME = "pgmName"
    static let KEY_TIME_INTERVAL = "timeInterval"
    static let KEY_START_TIMESTAMP = "startTimeStamp"
    static let KEY_END_TIMESTAMP = "endTimeStamp"
    
    static var sharedInstance : AppDelegate?
    
    var timeScrollView : UIScrollView!
    var dateScrollView : UIScrollView!
    var epgScrollView : UIScrollView!
    var pgmScrollView : UIScrollView!
    var logoScrollView : UIScrollView!
    
    var logoImageView : UIImageView!
    var pgmView : EPGProgramView!
    var liveIndicator : UIView!
    
    var mEPGDatasource : EPGDatasource?
    var cards : [EpgCardV2.card]?
    var channels : [EpgCardV2.channelCard]?
    
    let dateTimeHeight : CGFloat = 30
    let epgHeight : CGFloat = 100
    
    let timInterval = 30
    let oneMinuteWidth = 12.0
    let intervalInMinutes = 30.0
    
    var datesAvailable : [String]!
    let startOfDay = Date().startOfDay
    var timestamp = [Double]()
    var timer : Timer?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadTimestamps()
        
        //        mEPGDatasource = EPGDatasource()
        //        self.cards = cards
        
        //        pgmsForSelectedDate = [
        //            ["timeInterval" : "03:00 am - 04:00 am", "pgmName" : "Musix", "startTimeStamp" : timestamp[0], "endTimeStamp" : timestamp[1]],
        //            ["timeInterval" : "04:00 am - 04:30 am", "pgmName" : "News", "startTimeStamp" : timestamp[1],  "endTimeStamp" : timestamp[2]],
        //            ["timeInterval" : "04:30 am - 05:00 am", "pgmName" : "World news", "startTimeStamp" : timestamp[2],  "endTimeStamp" : timestamp[3]],
        //            ["timeInterval" : "05:00 am - 07:00 am", "pgmName" : "Movie", "startTimeStamp" : timestamp[3],  "endTimeStamp" : timestamp[4]],
        //            ["timeInterval" : "07:00 am - 07:30 am", "pgmName" : "Debates", "startTimeStamp" : timestamp[4],  "endTimeStamp" : timestamp[5]],
        //            ["timeInterval" : "04:00 pm - 04:30 pm", "pgmName" : "Songs", "startTimeStamp" : timestamp[6],  "endTimeStamp" : timestamp[7]],
        //            ["timeInterval" : "04:30 pm - 05:30 pm", "pgmName" : "Global politics", "startTimeStamp" : timestamp[7],  "endTimeStamp" : timestamp[8]]]
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI setup
    
    func setUpLiveIndicator () {
        liveIndicator = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: pgmScrollView.contentSize.height))
        liveIndicator.backgroundColor = .red
        pgmScrollView.addSubview(liveIndicator)
    }
    
    func setUpLayout(epgView : UIView)  {
        var nextY = 0.0
        var nextX = 0.0
        
        if let _ = channels {
            //TimeView
            timeScrollView = UIScrollView(frame: CGRect(x: 170, y: nextY, width: self.frame.size.width, height: dateTimeHeight))
            timeScrollView.isUserInteractionEnabled = true
            setUpIntervals()
            nextY += dateTimeHeight + 5.0
            epgView.addSubview(timeScrollView)
            timeScrollView.delegate = self
            
            //Program view
            epgScrollView =  UIScrollView(frame: CGRect(x: 0.0, y:nextY, width: self.frame.size.width, height: (self.frame.size.height - nextY)))
            
            //Channel logo
            logoScrollView = UIScrollView(frame: CGRect(x: 10.0, y:0.0, width: epgHeight, height: (self.frame.size.height - nextY)))
            nextX += logoImageView.frame.size.width + 20.0
            epgScrollView.addSubview(logoScrollView)
            //Add programs
            pgmScrollView = UIScrollView(frame: CGRect(x: nextX, y: 0.0, width: (self.frame.size.width - nextX), height: (self.frame.size.height - nextY)))
//            pgmScrollView.backgroundColor = .blue
            updatePgm()
            epgScrollView.addSubview(pgmScrollView)
            pgmScrollView.delegate = self
            epgView.addSubview(epgScrollView)
            
            setUpLiveIndicator()
            findCurrentPos()
            
            timer = Timer.scheduledTimer(timeInterval:10, target:self, selector:#selector(prozessTimer), userInfo: nil, repeats: true)
            
        }
//        self.backgroundColor = .systemTeal
    }
    
    func setUpIntervals() {
        let hours = getHours()
        var givenX : CGFloat = 0
        let width : CGFloat = oneMinuteWidth * intervalInMinutes
        timeScrollView.contentSize = timeScrollView.frame.size
        for thisHour in hours {
            let timeBtn = UIButton()
            timeBtn.frame.origin = CGPoint(x: givenX, y: 0)
            timeBtn.frame.size = CGSize(width: width, height: dateTimeHeight)
            timeBtn.setTitle(thisHour, for: .normal)
            timeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            timeBtn.isUserInteractionEnabled = false
            timeScrollView.addSubview(timeBtn)
            setScrollWidth(scrollView: timeScrollView, x: givenX, fixedWidth: width)
            givenX += (width + 10 )
            
        }
    }
    
    func setScrollWidth (scrollView : UIScrollView, x origin : CGFloat, fixedWidth providedWidth : CGFloat) {
        if origin > self.frame.size.width {
            scrollView.contentSize.width += providedWidth + 10
        } else if  (origin + providedWidth) > self.frame.size.width {
            let missingWidth = (origin + providedWidth) - self.frame.size.width
            scrollView.contentSize.width += missingWidth + 10
        }
    }
    
    func findWidth (startTime : Double, endTime : Double) -> CGFloat {
        let interval = endTime - startTime
        let minuteInterval = interval / 60
        var widthFound = 0.0
        if minuteInterval < intervalInMinutes {
            widthFound = (minuteInterval * oneMinuteWidth)
        } else {
            let fillerWidth = ((minuteInterval / intervalInMinutes) - 1) * 10
            widthFound = (minuteInterval * oneMinuteWidth) + fillerWidth
            if widthFound < 0 {
                widthFound *= -1
            }
        }
        return widthFound
    }
    
    func findCurrentPos () {
        let now = Date()//.timeIntervalSince1970
        
      //TODO - Remove in integration
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let thisTime = format.string(from: now)
        let dateTimeInStr = "28-06-2022 \(thisTime)"
        format.dateFormat = "dd-MM-yyy' 'HH:mm"
        let dateTime = format.date(from: dateTimeInStr)?.timeIntervalSince1970
        
        let minutesPassed = round((dateTime! - Date().startOfDay) / 60)
        let fillers = round((((dateTime! - Date().startOfDay) / 60) / intervalInMinutes)) - 1
        let currentPosition = (minutesPassed * oneMinuteWidth) + (fillers * 10)
        
        pgmScrollView.contentOffset.x = currentPosition
        timeScrollView.contentOffset.x = currentPosition
        liveIndicator.frame.origin.x += currentPosition
    }
    
    @objc func prozessTimer() {
        liveIndicator.frame.origin.x += 2
    }
    
    func isEndOfInterval() -> Bool {
        let nowTime = Date()
        let fm = DateFormatter()
        fm.dateFormat = "mm"
        fm.string(from: nowTime)
        
        
        if (fm.string(from: nowTime) == "00" || fm.string(from: nowTime) == "30") {
            return true
        }
        return false
    }
    
    // MARK: - Focus handlers
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
    }

    override func updateFocusIfNeeded() {
        super.updateFocusIfNeeded()
        if pgmView.pgmBtnMask.isFocused {
            pgmView.pgmBtnMask.backgroundColor = .orange
        }
    }
    
    // MARK: - Content setup
    
    func getHours () -> [String] {
        var givenHour = [String]()
        if timInterval == 30 {
            let dayNight = ["am", "pm"]
            let timeForDay = ["12", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11"]
            for m in dayNight {
                for i in timeForDay {
                    givenHour.append("\(i):00 \(m)")
                    givenHour.append("\(i):30 \(m)")
                }
            }
        }
        return givenHour
    }
    
    func updatePgm () {
        var nextX: CGFloat = 0.0
        var y : CGFloat = 0.0
        var width : CGFloat = oneMinuteWidth * intervalInMinutes
        var lastEndTime : Double = 0
        var firstPgm : Bool = true, lastPgm : Bool = false, firstChannel = true
        pgmScrollView.contentSize = pgmScrollView.frame.size
        pgmScrollView.backgroundColor = .cyan
        guard let channels = channels else {
            return
        }
        
        for channel in channels {
            guard let cards = channel.cards else {
                return
            }
            

            if firstChannel{
                firstChannel = false
            } else {
                firstPgm = true
                nextX = 0
                y += epgHeight
                epgScrollView.contentSize.height += epgHeight
                pgmScrollView.contentSize.height += epgHeight
            }
            logoImageView = UIImageView(frame: CGRect(x: 10.0, y: y, width: epgHeight, height: epgHeight))
            logoImageView.image = UIImage(systemName: "applelogo")
            logoScrollView.addSubview(logoImageView)
            
            for i in 0..<cards.count {
                print(cards[i])
                
                if firstPgm {
                    let dayStart = Date().startOfDay
                    if dayStart != Double((cards[i].interval?.startValue)!) ?? 0 {
                        width = findWidth(startTime: dayStart, endTime: Double((cards[i].interval?.startValue)!) ?? 0 )
                        pgmView = EPGProgramView.instanceFromNib()
                        let showCard = loadEmptyCard(pgmView: pgmView, givenWidth: width, givenX: &nextX, givenY: y)
                        
                        pgmScrollView.addSubview(showCard.0)
                        setScrollWidth(scrollView: pgmScrollView, x: nextX, fixedWidth: width)
                        
                        nextX = showCard.1
                    }
                    lastEndTime =  Double((cards[i].interval?.startValue)!) ?? 0
                    firstPgm = false
                } else if lastEndTime != Double((cards[i].interval?.startValue)!) ?? 0 {
                    width = findWidth(startTime: lastEndTime, endTime: Double((cards[i].interval?.startValue)!) ?? 0)
                    pgmView = EPGProgramView.instanceFromNib()
                    let showCard = loadEmptyCard(pgmView: pgmView, givenWidth: width, givenX: &nextX, givenY: y)
                    
                    pgmScrollView.addSubview(showCard.0)
                    setScrollWidth(scrollView: pgmScrollView, x: nextX, fixedWidth: width)
                    
                    nextX = showCard.1
                    lastEndTime =  Double((cards[i].interval?.startValue)!) ?? 0
                    
                }
                
                
                width = findWidth(startTime: Double((cards[i].interval?.startValue)!) ?? 0, endTime: Double((cards[i].interval?.endValue)!) ?? 0)
                pgmView = EPGProgramView.instanceFromNib()
                
                let showCard = loadShowCard(pgmView: pgmView, givenWidth: width, givenX: &nextX, givenY: y, epgPgm: cards[i])
                pgmScrollView.addSubview(showCard.0)
                setScrollWidth(scrollView: pgmScrollView, x: nextX, fixedWidth: width)
                nextX = showCard.1
                
                lastEndTime = Double((cards[i].interval?.endValue)!) ?? 0
                
                if Double((cards[cards.count-1].interval?.endValue)!) == Double((cards[i].interval?.endValue)!) {
                    lastPgm = true
                    if lastPgm {
                        if Date().endOfDay != Double((cards[i].interval?.endValue)!) ?? 0 {
                            width = findWidth(startTime: Double((cards[i].interval?.endValue)!) ?? 0, endTime: Date().endOfDay)
                            pgmView = EPGProgramView.instanceFromNib()
                            
                            let showCard = loadEmptyCard(pgmView: pgmView, givenWidth: width, givenX: &nextX, givenY: y)
                            pgmScrollView.addSubview(showCard.0)
                            setScrollWidth(scrollView: pgmScrollView, x: nextX, fixedWidth: width)
                            nextX = showCard.1
                            lastPgm = false
                        }
                    }
                }
            }
        }
    }
    
    func loadTimestamps () {
        
        let timeList = ["2:18 am", "02:15 am", "02:45  am", "04:53  am", "09:50 am", "10:25 am", "11:50 am", "12:55 PM", "02:27 PM", "03:00 PM", "03:18 PM", "04:35 PM"]
        let todayDate = Date.getCurrentDate()
        
        let dfm = DateFormatter()
        dfm.dateFormat = "dd-MM-yyyy' 'hh:mm a"
        
        for thisTime in timeList {
            let dateTimeInStr = "28-06-2022 \(thisTime)" //"\(todayDate) \(thisTime)"
            let dateTime = dfm.date(from: dateTimeInStr)?.timeIntervalSince1970
            timestamp.append(dateTime ?? 0)
        }
    }
    
    func loadEmptyCard (pgmView : EPGProgramView, givenWidth : CGFloat, givenX : inout CGFloat, givenY : CGFloat) -> (EPGProgramView, CGFloat) {
        pgmView.frame.origin = CGPoint(x: givenX, y: givenY)
        pgmView.frame.size = CGSize(width: givenWidth, height: epgHeight)
        pgmView.layer.cornerRadius = 20
        pgmView.pgmBtnMask.layer.cornerRadius = 20
        pgmView.pgmBtnMask.cornerRadius = 20
        pgmView.pgmBtnMask.center = pgmView.clockImage.center

        pgmView.clockImage.image = UIImage(systemName: "xmark.circle")
        pgmView.pgmBtnMask.isHighlighted = false
       
        
        givenX += givenWidth + 10
        return (pgmView, givenX)
    }
    
    func loadShowCard (pgmView : EPGProgramView, givenWidth : CGFloat, givenX : inout CGFloat, givenY : CGFloat, epgPgm : EpgCardV2.card)  -> (EPGProgramView, CGFloat){
        pgmView.frame.origin = CGPoint(x: givenX, y: givenY)
        pgmView.frame.size = CGSize(width: givenWidth, height: epgHeight)
        pgmView.layer.cornerRadius = 20
        pgmView.pgmBtnMask.layer.cornerRadius = 20
        pgmView.pgmBtnMask.cornerRadius = 20
        pgmView.clockImage.load(url: URL(string: (epgPgm.thumbnails?.oneXone?.url_150)!)!)
        pgmView.intervalLabel.text = epgPgm.interval?.formattedText
        pgmView.pgmNameLabel.text = epgPgm.title
       
        pgmView.backgroundColor = .darkGray
        givenX += (givenWidth + 10 )
        return (pgmView, givenX)
    }
}

extension EPGView : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == timeScrollView {
            pgmScrollView.contentOffset.x = timeScrollView.contentOffset.x
        } else if scrollView == pgmScrollView {
            timeScrollView.contentOffset.x = pgmScrollView.contentOffset.x
        }
    }
}

extension Date {
    var startOfDay: Double {
        //        return Calendar.current.startOfDay(for: self).timeIntervalSince1970
        // MARK: - todo
        return 1656354600
    }
    
//    var dayStart : Date {
//        return Calendar.current.startOfDay(for: self)
//    }
    
    var endOfDay : Double {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        // MARK: - todo
        return 1656440940
        //        return Calendar.current.date(byAdding: components, to: dayStart)!.timeIntervalSince1970
    }
    
    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: Date())
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}


