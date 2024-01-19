//
//  CalenderView.swift
//  myCalender2
//
//  Created by Muskan on 10/22/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import UIKit

struct Colors {
    static var darkGray = #colorLiteral(red: 0.3764705882, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
    static var darkRed = #colorLiteral(red: 1, green: 0.231372549, blue: 0.1882352941, alpha: 1)
    static var darkGreen = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
}

struct Style {
    static var bgColor = UIColor.white
    static var monthViewLblColor = UIColor.black
    static var monthViewBtnRightColor = UIColor.black
    static var monthViewBtnLeftColor = UIColor.black
    static var activeCellLblColor = UIColor.white
    static var activeCellLblColorHighlighted = UIColor.black
    static var weekdaysLblColor = UIColor.black
    
    static func themeDark(){
        bgColor = Colors.darkGray
        monthViewLblColor = UIColor.white
        monthViewBtnRightColor = UIColor.white
        monthViewBtnLeftColor = UIColor.white
        activeCellLblColor = UIColor.white
        activeCellLblColorHighlighted = UIColor.black
        weekdaysLblColor = UIColor.white
    }
    
    static func themeLight(){
        bgColor = UIColor.white
        monthViewLblColor = UIColor.black
        monthViewBtnRightColor = UIColor.black
        monthViewBtnLeftColor = UIColor.black
        activeCellLblColor = UIColor.darkText
        activeCellLblColorHighlighted = UIColor.white
        weekdaysLblColor = UIColor.black
    }
}

class CalenderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MonthViewDelegate {
    var delegate: CalenderDelegate?
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    weak var daysObject : HolidayBaseRes?

    var redSlotDate = [0]
    var redObject : Array? = [HolidayResponse]()
    
    
    var greenSlotDate = [0]
    var greenObject : Array? = [HolidayResponse]()

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        initializeView()
    }
    
    convenience init(theme: MyTheme) {
        self.init()
        
        if theme == .dark {
            Style.themeDark()
        } else {
            Style.themeLight()
        }
        
        initializeView()
    }
    
    func changeTheme() {
        myCollectionView.reloadData()
        monthView.lblName.textColor = Style.monthViewLblColor
        monthView.btnRight.setTitleColor(Style.monthViewBtnRightColor, for: .normal)
        monthView.btnLeft.setTitleColor(Style.monthViewBtnLeftColor, for: .normal)
        
        for i in 0..<7 {
            (weekdaysView.myStackView.subviews[i] as! UILabel).textColor = Style.weekdaysLblColor
        }
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        
        print(currentMonthIndex)
                 print(currentYear)
                        
                 print(presentMonthIndex)
                 print(presentYear)
        
        if (sender.direction == .left)
        {

         
        }
        

        if (sender.direction == .right)
        {

           
        }
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
            print(notification.userInfo ?? "")
            self.daysObject = notification.object as? HolidayBaseRes
            if self.daysObject != nil {
//               let filteredArrayOnDict = self.daysObject?.specialEventMasterDatalist?.map { return ($0.from_Date)}
//
////                self.localPerformObject = self.performObject?.performIDData?.filter{
////                                                           return($0.examTypeID == Int(self.selectedStringKey!))
////                                                       }
//                //  var strArray = str.components(separatedBy: "-")
//
//                let filterObj = filteredArrayOnDict?.filter{ return( Int(($0?.components(separatedBy: "-")[1])!) == currentMonthIndex)
//
//                }
//                print(filterObj)

                self.daysSlotMethod()
                
           }
           
    }

   
    func initializeView() {
   
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("calendarObject"), object: nil)

        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        swipeGesture.direction = .left
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        rightSwipe.direction = .right

        self.addGestureRecognizer(swipeGesture)
        self.addGestureRecognizer(rightSwipe)

        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        firstWeekDayOfMonth=getFirstWeekDay()
        
        //for leap years, make february month of 29 days
        if currentMonthIndex == 2 && currentYear % 4 == 0 {
            numOfDaysInMonth[currentMonthIndex-1] = 29
        }
        //end
        
        presentMonthIndex=currentMonthIndex
        presentYear=currentYear
        
        setupViews()
        
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        myCollectionView.register(dateCVCell.self, forCellWithReuseIdentifier: "Cell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfDaysInMonth[currentMonthIndex-1] + firstWeekDayOfMonth - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! dateCVCell
        cell.backgroundColor=UIColor.clear
        if indexPath.item <= firstWeekDayOfMonth - 2 {
            cell.isHidden=true
        } else {
            let calcDate = indexPath.row-firstWeekDayOfMonth+2
            cell.isHidden=false
            cell.dateLbl.text="\(calcDate)"
            cell.redDotLbl.isHidden = true
            cell.greenDotLbl.isHidden = true
            if self.redSlotDate.contains(calcDate){
                cell.isUserInteractionEnabled=true
                cell.redDotLbl.isHidden = false
            }
            else if greenSlotDate.contains(calcDate){
                cell.isUserInteractionEnabled=true
                cell.greenDotLbl.isHidden = false
            }
            else {
                cell.isUserInteractionEnabled=true
                cell.dateLbl.textColor = Style.activeCellLblColor
                cell.redDotLbl.isHidden = true
                cell.greenDotLbl.isHidden = true
            }
            if calcDate < self.todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex  {
               // cell.isUserInteractionEnabled=false
               // cell.dateLbl.textColor = UIColor.red
            }else if calcDate == self.todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
                cell.dateLbl.textColor = UIColor.white
                cell.backgroundColor = UIColor.MyTheme.currentDayColor
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell=collectionView.cellForItem(at: indexPath)
        let calcDate = indexPath.row-firstWeekDayOfMonth+2
        if  redSlotDate.contains(calcDate) {
            cell?.backgroundColor=UIColor.clear
            let lbl = cell?.subviews[1] as! UILabel
            lbl.textColor=UIColor.black
            let redStrOnDict1 = self.redObject?.filter {
                return ((Int(($0.from_Date?.components(separatedBy: "-")[0])!) != nil) || Int(($0.to_Date?.components(separatedBy: "-")[0])!) == calcDate)
            }
            delegate?.didTapDate(date: redStrOnDict1?.first?.name ?? "", available: false)
        } else if  greenSlotDate.contains(calcDate) {
            cell?.backgroundColor=UIColor.clear
            let lbl = cell?.subviews[1] as! UILabel
            lbl.textColor=UIColor.black
            let greenStrOnDict1 = self.greenObject?.filter {
                  return ((Int(($0.from_Date?.components(separatedBy: "-")[0])!) != nil) || Int(($0.to_Date?.components(separatedBy: "-")[0])!) == calcDate)
            }
            delegate?.didTapDate(date: greenStrOnDict1?.first?.name ?? "", available: false)
            
        } else {
            cell?.backgroundColor=Colors.darkGray
            let lbl = cell?.subviews[1] as! UILabel
            lbl.textColor=UIColor.white
            delegate?.didTapDate(date: "Date:\(calcDate)/\(currentMonthIndex)/\(currentYear)", available: true)
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell=collectionView.cellForItem(at: indexPath)
       
        let calcDate = indexPath.row-firstWeekDayOfMonth+2
        if  redSlotDate.contains(calcDate) {
            cell?.backgroundColor=UIColor.clear
            let lbl = cell?.subviews[1] as! UILabel
            lbl.textColor=UIColor.black
        } else if greenSlotDate.contains(calcDate) {
              cell?.backgroundColor=UIColor.clear
              let lbl = cell?.subviews[1] as! UILabel
              lbl.textColor=UIColor.black
        } else {
            cell?.backgroundColor=UIColor.clear
            let lbl = cell?.subviews[1] as! UILabel
            lbl.textColor = Style.activeCellLblColor
             if calcDate == self.todaysDate && currentYear == presentYear && currentMonthIndex == presentMonthIndex {
//                 lbl.textColor = UIColor.MyTheme.currentDayColor
                lbl.textColor = UIColor.white
                cell?.backgroundColor = UIColor.MyTheme.currentDayColor

             }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width/7 - 8
        let height: CGFloat = 40
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func getFirstWeekDay() -> Int {
        let day = ("\(currentYear)-\(currentMonthIndex)-01".date?.firstDayOfTheMonth.weekday)!
        return day == 7 ? 1 : day
    }
    
    func didChangeMonth(monthIndex: Int, year: Int) {
        currentMonthIndex=monthIndex+1
        currentYear = year
        
        //for leap year, make february month of 29 days
        if monthIndex == 1 {
            if currentYear % 4 == 0 {
                numOfDaysInMonth[monthIndex] = 29
            } else {
                numOfDaysInMonth[monthIndex] = 28
            }
        }
        //end
        
        firstWeekDayOfMonth=getFirstWeekDay()
        
        myCollectionView.reloadData()
        
        monthView.btnLeft.isEnabled = true
        
        self.daysSlotMethod()
        
    }
    
    func daysSlotMethod() {
        
            self.redSlotDate.removeAll()
            self.greenSlotDate.removeAll()
            self.greenObject?.removeAll()
            self.redObject?.removeAll()
        
               let greenStrOnDict = self.daysObject?.holidayMasterDatalist?.filter {
                    return (Int(($0.from_Date?.components(separatedBy: "-")[1])!) == currentMonthIndex  && Int(($0.from_Date?.components(separatedBy: "-")[2])!) == currentYear)
                }
                   self.greenObject = greenStrOnDict
                   if self.greenObject?.count ?? 0 > 0  {
                       for index in 0..<self.greenObject!.count {
                            let fromDay = self.greenObject?[index].from_Date
                            let endToDay = self.greenObject?[index].to_Date
                            let strArray = fromDay?.components(separatedBy: "-")
                            let startDay = Int((strArray?[0])!) ?? 0
                            let endDayArray = endToDay?.components(separatedBy: "-")
                            let endDay = Int((endDayArray?[0])!) ?? 0
                            for i in startDay...endDay {
                               self.greenSlotDate.append(i)
                            }
                       }
                   }
                       
               let redStrOnDict = self.daysObject?.specialEventMasterDatalist?.filter {
                            return (Int(($0.from_Date?.components(separatedBy: "-")[1])!) == currentMonthIndex && Int(($0.from_Date?.components(separatedBy: "-")[2])!) == currentYear)
                }
        
                   self.redObject = redStrOnDict
                   if self.redObject?.count ?? 0 > 0  {
                       for index in 0..<self.redObject!.count {
                           let fromDay = self.redObject?[index].from_Date
                           let endToDay = self.redObject?[index].to_Date
                           let strArray = fromDay?.components(separatedBy: "-")
                           let startDay = Int((strArray?[0])!) ?? 0
                           let endDayArray = endToDay?.components(separatedBy: "-")
                           let endDay = Int((endDayArray?[0])!) ?? 0
                           for i in startDay...endDay {
                              self.redSlotDate.append(i)
                           }
                        
//                           let objectDay = self.redObject?[index].from_Date
//                           let strArray = objectDay?.components(separatedBy: "-")
//                           self.redSlotDate.append(Int((strArray?[0])!) ?? 0)
                       }
                   }
                   
              
            self.myCollectionView.reloadData()
    }
    
    func setupViews() {
        addSubview(monthView)
        monthView.topAnchor.constraint(equalTo: topAnchor).isActive=true
        monthView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        monthView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        monthView.heightAnchor.constraint(equalToConstant: 40).isActive=true
        monthView.delegate=self
        
        addSubview(weekdaysView)
        weekdaysView.topAnchor.constraint(equalTo: monthView.bottomAnchor,constant: 5).isActive=true
        weekdaysView.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        weekdaysView.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        weekdaysView.heightAnchor.constraint(equalToConstant: 30).isActive=true
        
        addSubview(myCollectionView)
        myCollectionView.topAnchor.constraint(equalTo: weekdaysView.bottomAnchor, constant: 5).isActive=true
        myCollectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive=true
        myCollectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive=true
        myCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    
    let monthView: MonthView = {
        let v=MonthView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let weekdaysView: WeekdaysView = {
        let v=WeekdaysView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        let myCollectionView=UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.translatesAutoresizingMaskIntoConstraints=false
        myCollectionView.backgroundColor=UIColor.clear
        myCollectionView.allowsMultipleSelection=false
        return myCollectionView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
}


protocol CalenderDelegate {
    
    func didTapDate(date:String, available:Bool)
}





class dateCVCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor=UIColor.clear
        layer.cornerRadius = self.frame.height / 2
        layer.masksToBounds=true
        
        setupViews()
        setdotLabel()
    }
    
    func setupViews() {
        addSubview(dateLbl)
        dateLbl.topAnchor.constraint(equalTo: topAnchor).isActive=true
        dateLbl.leftAnchor.constraint(equalTo: leftAnchor).isActive=true
        dateLbl.rightAnchor.constraint(equalTo: rightAnchor).isActive=true
        dateLbl.bottomAnchor.constraint(equalTo: bottomAnchor).isActive=true
    }
    
    func setdotLabel() {
        addSubview(redDotLbl)
        addSubview(greenDotLbl)
        redDotLbl.frame = CGRect(x: (self.frame.size.width-12)/2, y: 28, width: 12, height: 12)
        redDotLbl.layer.cornerRadius = redDotLbl.frame.size.height/2.0
        redDotLbl.layer.masksToBounds = true

        greenDotLbl.frame = CGRect(x: (self.frame.size.width-12)/2, y: 1, width: 12, height: 12)
        greenDotLbl.layer.cornerRadius = greenDotLbl.frame.size.height/2.0
        greenDotLbl.layer.masksToBounds = true

    }
    
    let dateLbl: UILabel = {
        let label = UILabel()
        label.text = "00"
        label.textAlignment = .center
        label.font =  UIFont.init(name: "HelveticaNeue-Bold", size: 15) //UIFont.systemFont(ofSize: 16)
        label.textColor=Colors.darkGray
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    
    let redDotLbl: UILabel = {
        let label = UILabel()
        label.backgroundColor=Colors.darkRed
        label.isHidden = true
        return label
    }()
    
    let greenDotLbl: UILabel = {
        let label = UILabel()
        label.backgroundColor=Colors.darkGreen
        label.isHidden = true

        return label
    }()
    
    
    
 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//get first day of the month
extension Date {
    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }
    var firstDayOfTheMonth: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
    }
}

//get date from string
extension String {
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var date: Date? {
        return String.dateFormatter.date(from: self)
    }
}



//let redArrayOnDict = self.daysObject?.holidayMasterDatalist?.map { return ($0.from_Date)}
//
//             let filterObj = redArrayOnDict?.filter{
//                return( Int(($0?.components(separatedBy: "-")[1])!) == currentMonthIndex)
//             }
//
//            if filterObj?.count ?? 0 > 0  {
//                 for index in 0..<filterObj!.count {
//                     let strArray = filterObj?[index]?.components(separatedBy: "-")
//
//
//
//                     greenSlotDate.append(Int((strArray?[0])!) ?? 0)
//                 }
//             }
//
//             let greenArrayOnDict = self.daysObject?.specialEventMasterDatalist?.map { return ($0.from_Date)}
//             let filterGreObj = greenArrayOnDict?.filter{ return( Int(($0?.components(separatedBy: "-")[1])!) == currentMonthIndex)
//                    }
//
//            if filterObj?.count ?? 0 > 0 {
//                    for index in 0..<filterGreObj!.count {
//                        let strArray = filterGreObj?[index]?.components(separatedBy: "-")
//                        redSlotDate.append(Int((strArray?[0])!) ?? 0)
//                    }
//             }









