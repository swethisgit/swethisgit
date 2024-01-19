//
//  EPGViewController.swift
//  EPGComponent
//
//  Created by Sweda Thiyagarajan on 18/06/2022.
//

import UIKit
import TVMLKit

class EPGViewController: UIViewController {
    
    static let KEY_PGM_NAME = "pgmName"
    static let KEY_TIME_INTERVAL = "timeInterval"
    static let KEY_START_TIMESTAMP = "startTimeStamp"
    static let KEY_END_TIMESTAMP = "endTimeStamp"
    
    var timeScrollView : UIScrollView!
    var dateScrollView : UIScrollView!
    var epgScrollView : UIScrollView!
    var pgmScrollView : UIScrollView!
    
    var logoImageView : UIImageView!
    var pgmView : EPGProgramView!
    var liveIndicator : UIView!
    
    let dateTimeHeight : CGFloat = 80
    let epgHeight : CGFloat = 200
    
    let timInterval = 30
    let oneMinuteWidth = 24.0
    let intervalInMinutes = 30.0

    let datesAvailable = ["20 jun", "21 jun", "22 jun", "23 jun", "24 jun", "25 jun", "27 jun"]
    let startOfDay = Date().startOfDay
    var timestamp = [Double]()
    var pgmsForSelectedDate = [Dictionary<String, Any>]()
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadTimestamps()
        
        pgmsForSelectedDate = [
            ["timeInterval" : "03:00 am - 04:00 am", "pgmName" : "Musix", "startTimeStamp" : timestamp[0], "endTimeStamp" : timestamp[1]],
            ["timeInterval" : "04:00 am - 04:30 am", "pgmName" : "News", "startTimeStamp" : timestamp[1],  "endTimeStamp" : timestamp[2]],
            ["timeInterval" : "04:30 am - 05:00 am", "pgmName" : "World news", "startTimeStamp" : timestamp[2],  "endTimeStamp" : timestamp[3]],
            ["timeInterval" : "05:00 am - 07:00 am", "pgmName" : "Movie", "startTimeStamp" : timestamp[3],  "endTimeStamp" : timestamp[4]],
            ["timeInterval" : "07:00 am - 07:30 am", "pgmName" : "Debates", "startTimeStamp" : timestamp[4],  "endTimeStamp" : timestamp[5]],
            ["timeInterval" : "04:00 pm - 04:30 pm", "pgmName" : "Songs", "startTimeStamp" : timestamp[6],  "endTimeStamp" : timestamp[7]],
            ["timeInterval" : "04:30 pm - 05:30 pm", "pgmName" : "Global politics", "startTimeStamp" : timestamp[7],  "endTimeStamp" : timestamp[8]]]

//        setUpLayout()
//        setUpLiveIndicator()
//        findCurrentPos()
        
    }
    
    // MARK: - UI setup
    
    func setUpLiveIndicator () {
        liveIndicator = UIView(frame: CGRect(x: 0, y: 0, width: 2, height: pgmScrollView.frame.size.height))
        liveIndicator.backgroundColor = .red
        pgmScrollView.addSubview(liveIndicator)
    }
    
    func setUpLayout() {
        var nextY = 0.0
        var nextX = 0.0
        //Date view
        dateScrollView = UIScrollView(frame: CGRect(x: 220.0, y: nextY, width: self.view.frame.size.width, height: dateTimeHeight))
        dateScrollView.isUserInteractionEnabled = true
        availableDateSetup()
        nextY += dateTimeHeight + 15
        self.view.addSubview(dateScrollView)
        
        //TimeView
        timeScrollView = UIScrollView(frame: CGRect(x: 220.0, y: nextY, width: self.view.frame.size.width, height: dateTimeHeight))
        timeScrollView.isUserInteractionEnabled = true
        setUpIntervals()
        nextY += timeScrollView.frame.size.height + 20.0
        self.view.addSubview(timeScrollView)
        
        //Program view
        epgScrollView =  UIScrollView(frame: CGRect(x: 0.0, y:nextY, width: self.view.frame.size.width, height: epgHeight))
        
        //Channel logo
        logoImageView = UIImageView(frame: CGRect(x: 10.0, y: 0.0, width: 200, height: epgHeight))
        logoImageView.image = UIImage(systemName: "applelogo")
        epgScrollView.addSubview(logoImageView)
        nextX += logoImageView.frame.size.width + 20.0
       
        //Add programs
        pgmScrollView = UIScrollView(frame: CGRect(x: nextX, y: 0.0, width: (self.view.frame.size.width - nextX), height: epgHeight))
        updatePgm()
        epgScrollView.addSubview(pgmScrollView)
        self.view.addSubview(epgScrollView)
        
        pgmScrollView.delegate = self
        timeScrollView.delegate = self
        timer = Timer.scheduledTimer(timeInterval:10, target:self, selector:#selector(prozessTimer), userInfo: nil, repeats: true)
    }

    func availableDateSetup () {
        var givenX : CGFloat = 0
        let width : CGFloat = oneMinuteWidth * intervalInMinutes
        dateScrollView.contentSize = dateScrollView.frame.size
        for thisDate in datesAvailable {
            let dateBtn = UIButton()
            dateBtn.frame.origin = CGPoint(x: givenX, y: 0)
            dateBtn.frame.size = CGSize(width: width, height: dateTimeHeight)
            dateBtn.setTitle(thisDate, for: .normal)
            dateBtn.setTitle(thisDate, for: .highlighted)
            dateBtn.setTitleColor(.yellow, for: .focused)
            dateBtn.backgroundColor = .black
            dateBtn.addTarget(self, action: #selector(refreshPgmToSelectedDate(_ : )), for: .primaryActionTriggered)
            dateScrollView.addSubview(dateBtn)
            setScrollWidth(scrollView: dateScrollView, x: givenX, fixedWidth: width)
            givenX += (width + 10 )
        }
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
            timeBtn.setTitleColor(.yellow, for: .focused)
            timeBtn.addTarget(self, action: #selector(hourSelected(by: )), for: .primaryActionTriggered)
            timeBtn.backgroundColor = .black
            timeScrollView.addSubview(timeBtn)
            setScrollWidth(scrollView: timeScrollView, x: givenX, fixedWidth: width)
            givenX += (width + 10 )

        }
    }
    
    func setScrollWidth (scrollView : UIScrollView, x origin : CGFloat, fixedWidth providedWidth : CGFloat) {
        if origin > self.view.frame.size.width {
            scrollView.contentSize.width += providedWidth + 10
        } else if  (origin + providedWidth) > self.view.frame.size.width {
            let missingWidth = (origin + providedWidth) - self.view.frame.size.width
            scrollView.contentSize.width += missingWidth + 10
        }
    }
    
    func findWidth (startTime : Double, endTime : Double) -> CGFloat {
        let interval = endTime - startTime
        let minuteInterval = interval / 60
        let fillerWidth = ((minuteInterval / intervalInMinutes) - 1) * 10
        let widthFound = (minuteInterval * oneMinuteWidth) + fillerWidth
        return widthFound
    }
    
    func findCurrentPos () {
        let now = Date().timeIntervalSince1970
        let minutesPassed = round((now - Date().startOfDay) / 60)
        let fillers = round((((now - Date().startOfDay) / 60) / intervalInMinutes)) - 1
        let currentPosition = (minutesPassed * oneMinuteWidth) + (fillers * 10)
        
        pgmScrollView.contentOffset.x = currentPosition
        timeScrollView.contentOffset.x = currentPosition
        liveIndicator.frame.origin.x += currentPosition
    }
    
    @objc func prozessTimer() {
        liveIndicator.frame.origin.x += 4
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

    // MARK: - Button event
    
    @objc func hourSelected(by sender : UIButton) {
        print (" sender \(sender.currentTitle)")
    }
    
    @objc func refreshPgmToSelectedDate(_ sender: UIButton?) {
        print (" sender \(sender?.currentTitle)")
    }
    
    func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        print ("focus updated")
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
        var width : CGFloat = oneMinuteWidth * intervalInMinutes
        var lastEndTime : Double = 0
        var firstPgm : Bool = true, lastPgm : Bool = false
        pgmScrollView.contentSize = pgmScrollView.frame.size
        
        for thisPgm in  pgmsForSelectedDate {
            if firstPgm {
                let dayStart = Date().startOfDay
                if dayStart != thisPgm[EPGViewController.KEY_START_TIMESTAMP] as! Double{
                    width = findWidth(startTime: dayStart, endTime: thisPgm[EPGViewController.KEY_START_TIMESTAMP] as! Double)
                    pgmView = EPGProgramView.instanceFromNib()
                    let showCard = loadEmptyCard(pgmView: pgmView, givenWidth: width, givenX: &nextX)
                    
                    pgmScrollView.addSubview(showCard.0)
                    setScrollWidth(scrollView: pgmScrollView, x: nextX, fixedWidth: width)

                    nextX = showCard.1
                }
                lastEndTime =  thisPgm[EPGViewController.KEY_START_TIMESTAMP] as! Double
                firstPgm = false
            } else if lastEndTime != thisPgm[EPGViewController.KEY_START_TIMESTAMP] as! Double {
                width = findWidth(startTime: lastEndTime, endTime: thisPgm[EPGViewController.KEY_START_TIMESTAMP] as! Double)
                pgmView = EPGProgramView.instanceFromNib()
                let showCard = loadEmptyCard(pgmView: pgmView, givenWidth: width, givenX: &nextX)
                
                pgmScrollView.addSubview(showCard.0)
                setScrollWidth(scrollView: pgmScrollView, x: nextX, fixedWidth: width)

                nextX = showCard.1
                lastEndTime =  thisPgm[EPGViewController.KEY_START_TIMESTAMP] as! Double

            }
            
            
            width = findWidth(startTime: thisPgm[EPGViewController.KEY_START_TIMESTAMP] as! Double, endTime: thisPgm[EPGViewController.KEY_END_TIMESTAMP] as! Double)
            pgmView = EPGProgramView.instanceFromNib()

            let showCard = loadShowCard(pgmView: pgmView, givenWidth: width, givenX: &nextX, epgPgm: thisPgm)
            pgmScrollView.addSubview(showCard.0)
            setScrollWidth(scrollView: pgmScrollView, x: nextX, fixedWidth: width)
            nextX = showCard.1
            
            lastEndTime = thisPgm[EPGViewController.KEY_END_TIMESTAMP] as! Double
            
            if (pgmsForSelectedDate[pgmsForSelectedDate.count-1][EPGViewController.KEY_END_TIMESTAMP]) as! Double == thisPgm[EPGViewController.KEY_END_TIMESTAMP] as! Double {
                lastPgm = true
                if lastPgm {
                    if Date().endOfDay != thisPgm[EPGViewController.KEY_END_TIMESTAMP] as! Double {
                        width = findWidth(startTime: thisPgm[EPGViewController.KEY_END_TIMESTAMP] as! Double, endTime: Date().endOfDay)
                        pgmView = EPGProgramView.instanceFromNib()

                        let showCard = loadEmptyCard(pgmView: pgmView, givenWidth: width, givenX: &nextX)
                        pgmScrollView.addSubview(showCard.0)
                        setScrollWidth(scrollView: pgmScrollView, x: nextX, fixedWidth: width)
                        nextX = showCard.1
                    }
                }
            }
        }
    }
    
    func loadTimestamps () {
        
        let timeList = ["03:00 am", "04:00 am", "04:30 am", "05:00 am", "07:00 am", "07:30 am", "04:00 pm", "04:30 pm", "05:30 pm"]
        let todayDate = Date.getCurrentDate()
        
        let dfm = DateFormatter()
        dfm.dateFormat = "dd-MM-yyyy' 'hh:mm a"
        
        for thisTime in timeList {
            let dateTimeInStr = "\(todayDate) \(thisTime)"
            let dateTime = dfm.date(from: dateTimeInStr)?.timeIntervalSince1970
            timestamp.append(dateTime ?? 0)
        }
    }
    
    func loadEmptyCard (pgmView : EPGProgramView, givenWidth : CGFloat, givenX : inout CGFloat) -> (EPGProgramView, CGFloat) {
        pgmView.frame.origin = CGPoint(x: givenX, y: 0)
        pgmView.frame.size = CGSize(width: givenWidth, height: epgHeight)
        pgmView.clockImage.image = UIImage(systemName: "xmark.circle")
        pgmView.intervalLabel.text = "No show"
        pgmView.pgmBtnMask.focusedBackgroundColor = .orange
        pgmView.pgmBtnMask.normalBackgroundColor = .darkGray
        givenX += givenWidth + 10
        return (pgmView, givenX)
    }
    
    func loadShowCard (pgmView : EPGProgramView, givenWidth : CGFloat, givenX : inout CGFloat, epgPgm : Dictionary<String, Any>)  -> (EPGProgramView, CGFloat){
        pgmView.frame.origin = CGPoint(x: givenX, y: 0)
        pgmView.frame.size = CGSize(width: givenWidth, height: epgHeight)
        pgmView.clockImage.image = UIImage(systemName: "clock")
        pgmView.pgmBtnMask.normalBackgroundColor = .darkGray
//        pgmView.pgmBtnMask.layer.cornerRadius = 
//        pgmView.intervalLabel.text = epgPgm[EPGViewController.KEY_TIME_INTERVAL] as? String
        pgmView.pgmNameLabel.text = epgPgm[EPGViewController.KEY_PGM_NAME] as? String
        givenX += (givenWidth + 10 )
        return (pgmView, givenX)
    }
}

extension EPGViewController : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == timeScrollView {
            pgmScrollView.contentOffset.x = timeScrollView.contentOffset.x
        } else if scrollView == pgmScrollView {
            timeScrollView.contentOffset.x = pgmScrollView.contentOffset.x
        }
    }
}

//extension Date {
//    var startOfDay: Double {
//        return Calendar.current.startOfDay(for: self).timeIntervalSince1970
//    }
//    
//    var dayStart : Date {
//        return Calendar.current.startOfDay(for: self)
//    }
//
//    var endOfDay : Double {
//        var components = DateComponents()
//        components.day = 1
//        components.second = -1
//        return Calendar.current.date(byAdding: components, to: dayStart)!.timeIntervalSince1970
//    }
//    
//    static func getCurrentDate() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        return dateFormatter.string(from: Date())
//    }
//}
