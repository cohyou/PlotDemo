//
//  SecondViewController.swift
//  PlotDemo
//
//  Created by OKAZAKI Yasuo on 2016/01/25.
//  Copyright © 2016年 F&Mnet. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, CKCalendarDelegate {
    var cal:CKCalendarView
    let plot:PlotView
    @IBOutlet weak var shortMonth: UILabel!
    @IBOutlet weak var shortSentence: UILabel!
    
    @IBOutlet weak var shortYear: UILabel!
    required init?(coder aDecoder: NSCoder) {
        cal = CKCalendarView()
        plot = PlotView()
        cal.frame = CGRectMake(39, 240, 300, 320)
        super.init(coder: aDecoder)
    }

    func cellDidSelected(sender: AnyObject) {
        cal.hidden = false
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        
        let view = CardView(frame: CGRect(x: 10, y: 64 + 10, width: 375 - 10 - 10, height: 44 * 6))
        
        self.view.insertSubview(view, atIndex: 0)
        
        plot.frame = CGRect(x: -21, y: -60, width: view.bounds.size.width, height: view.bounds.size.height)
        view.addSubview(plot)
        
        
        let tableRect = CGRect(x: 9.5, y: 64 + 10 + 44 * 6 + 4, width: 375 - 10 - 10 + 20, height: 44 * 6 + 12)
        let table = UITableView(frame:tableRect, style:UITableViewStyle.Plain)
        
        table.dataSource = self
        table.backgroundColor = UIColor.clearColor()
        table.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(table)
        
        table.rowHeight = 58
        
        
        cal.delegate = self
        self.view.addSubview(cal)
        cal.hidden = true
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let c = tableView.dequeueReusableCellWithIdentifier("cell")
        var cell:CardCell
        
        let red = UIColor(red: 205.0/255.0, green: 111.0/255.0, blue: 110.0/255.0, alpha: 1)
        
        if let c = c {
            cell = c as! CardCell
        } else {
            cell = CardCell(style: UITableViewCellStyle.Value2, reuseIdentifier: "cell")
            
            let tagRed = UIColor(red: 238.0/255.0, green: 0.0/255.0, blue: 38.0/255.0, alpha: 0.75)
            let tagBlue = UIColor(red: 15.0/255.0, green: 33.0/255.0, blue: 139.0/255.0, alpha: 0.75)
            let tagYellow = UIColor(red: 255.0/255.0, green: 204.0/255.0, blue: 0.0/255.0, alpha: 0.75)
            let tagGreen = UIColor(red: 0.0/255.0, green: 143.0/255.0, blue: 98.0/255.0, alpha: 0.75)
            let tagOrange = UIColor(red: 255.0/255.0, green: 127.0/255.0, blue: 0.0/255.0, alpha: 0.75)
            
            let tags = [[" 通常仕入"], [" 掛売上", " 昨年度請求分"], [" 通常仕入"], [" 掛売上", " 紹介分"], [" 追加", " 確認事項有"], [" 臨時支出"], [ "掛売上"], [" 振込"]]
            let colors = [tagRed, tagBlue, tagRed, tagBlue, tagRed, tagRed, tagBlue, tagBlue]
            let tagLabel = UILabel()
            tagLabel.text = tags[indexPath.row][0]
            tagLabel.backgroundColor = colors[indexPath.row]
            tagLabel.textColor = UIColor.whiteColor()
            tagLabel.font = UIFont.systemFontOfSize(12)
            tagLabel.frame = CGRect(x: 74, y: 32, width: tagLabel.frame.size.width, height: tagLabel.frame.size.height)
            tagLabel.sizeToFit()
            tagLabel.frame = CGRectInset(tagLabel.frame, -2, -1)
            tagLabel.layer.cornerRadius = 4
            tagLabel.clipsToBounds = true
            
            cell.contentView.addSubview(tagLabel)
            
            if tags[indexPath.row].count > 1 {
                let tagLabel2 = UILabel()
                tagLabel2.text = tags[indexPath.row][1]
                tagLabel2.backgroundColor = [tagRed, tagYellow, tagRed, tagGreen, tagOrange, tagRed, tagGreen, tagGreen][indexPath.row]
                tagLabel2.textColor = UIColor.whiteColor()
                tagLabel2.font = UIFont.systemFontOfSize(12)
                let xs:[CGFloat] = [0, 118, 0, 118, 106, 0, 0, 0]
                tagLabel2.frame = CGRect(x: xs[indexPath.row], y: 32, width: tagLabel2.frame.size.width, height: tagLabel2.frame.size.height)
                tagLabel2.sizeToFit()
                tagLabel2.frame = CGRectInset(tagLabel2.frame, -2, -1)
                tagLabel2.layer.cornerRadius = 4
                tagLabel2.clipsToBounds = true
                
                cell.contentView.addSubview(tagLabel2)
            }
            
            
            cell.dateLabel.userInteractionEnabled = true
            let recognizer = UITapGestureRecognizer(target: self, action: "cellDidSelected:")
            cell.dateLabel.addGestureRecognizer(recognizer)
        }
        
        cell.dateLabel.text = ["01/15", "02/20", "03/10", "03/20", "03/31", "04/15", "04/20", "04/30"][indexPath.row]
        cell.amountLabel.text = ["¥200,000", "¥300,000", "¥450,000", "¥300,000", "¥250,000", "¥450,000", "¥400,000", "¥500,000"][indexPath.row]
        switch indexPath.row {
        case 0, 2, 4, 5:
            cell.amountLabel.textColor = red
            cell.contentLabel.text = "支払"
        default:
            cell.amountLabel.textColor = UIColor(red: 103.0/255.0, green: 125.0/255.0, blue: 155.0/255.0, alpha: 1) // 13 35 65
            cell.contentLabel.text = "入金"
        }
        
        cell.contentLabel.text = ["来月分材料を仕入", "去年末請求分の入金", "繁忙期に備えて多めに仕入", "２月分入金", "追加分仕入", "予想外の注文分、急遽仕入", "３月分入金", "4/15分入金"][indexPath.row]
        
        return cell
    }
    
    func calendar(calendar: CKCalendarView!, didSelectDate date: NSDate!) {
        calendar.hidden = true
        plot.setPlotValue()
        shortMonth.hidden = true
        shortYear.hidden = true
        shortSentence.hidden = true
    }
}

