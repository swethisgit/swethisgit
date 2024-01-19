//
//  ViewController.swift
//  TimeIndicatorPOC
//
//  Created by Sweda Thiyagarajan on 19/05/2022.
//

import UIKit

class TimeIndicatorController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var channelTable: UITableView!
        
    let channelList = [ChannelList.SUNTV, ChannelList.VIJAYTV, ChannelList.JAYATV, ChannelList.ZEETAMIL, ChannelList.POLIMER, ChannelList.PUTHIYATHALAIMURAI, ChannelList.NEWS7, ChannelList.NEWS18, ChannelList.SUNNEWS, ChannelList.JAYANEWS, ChannelList.MAALAIMURASU, ChannelList.SUNMUSIC, ChannelList.VIJAYMUSIC, ChannelList.JAYAMAX, ChannelList.SUNMOVIES, ChannelList.VIJAYSUPER, ChannelList.ZEETHIRAI, ChannelList.RAJMUSIC, ChannelList.RAJMOVIES, ChannelList.RAJNEWS]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        channelTable.dataSource = self
        channelTable.delegate = self
        channelTable.register(UINib(nibName: "Showcatalogue", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
        channelTable.backgroundColor = .cyan
        scrollView.backgroundColor = .green
    }

    

}

extension TimeIndicatorController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       1// channelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : Showcatalogue!
        var x = 0
        if indexPath.row == 0 {
            cell = (tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Showcatalogue)

            cell.backgroundColor = .blue
            for (index, show) in ShowList.SUNTV.enumerated() {
                var subCell = ShowDetails()
                
                let c = cell.stackView.widthAnchor.constraint(equalTo: tableView.widthAnchor)
                c.priority = UILayoutPriority(rawValue: 750)
                c.isActive = true
                
                if index == 0 {
                    subCell = subCell.xibSetup(frame: CGRect(x: x, y: 0, width: 150, height: 90))! as! ShowDetails
                } else {
                    scrollView.contentSize.width += CGFloat(( index + 1) * 150) + 20
                    tableView.contentSize.width += scrollView.contentSize.width
                    cell.frame.size.width +=  CGFloat(( index + 1) * 150) + 10
                    cell.stackView.frame.size.width += scrollView.contentSize.width
                    x += Int(scrollView.contentSize.width) + 5
                    cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? Showcatalogue
                    
                    subCell = subCell.xibSetup(frame: CGRect(x: x, y: 0, width: 150 * (index + 1), height: 90))! as! ShowDetails
                   
                    print("x : \(x) width :\( cell.frame.size.width)   cell : \(cell.frame.size.width )" )
                }
                subCell.showName.text = show[Show.NAME] ?? "no name"
                subCell.showName.backgroundColor = .orange
                subCell.startingFrom.text = show[ShowTime.FROM] ?? "no start"
                subCell.endingAt.text = show[ShowTime.TO] ?? " no end"
                subCell.backgroundColor = .red
                
//                cell.backgroundColor = .purple
//                cell.stackView.backgroundColor = .brown
                cell.stackView.addSubview(subCell)
                print("name - \(show[Show.NAME] ?? "no name") from - \(show[ShowTime.FROM] ?? "no start") to - \(show[ShowTime.TO] ?? " no end") ")
            }
        }
        return cell
    }
}
