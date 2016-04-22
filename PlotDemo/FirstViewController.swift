//
//  FirstViewController.swift
//  PlotDemo
//
//  Created by OKAZAKI Yasuo on 2016/01/25.
//  Copyright © 2016年 F&Mnet. All rights reserved.
//

import UIKit
// import QuartzCore

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, CKCalendarDelegate {

    @IBOutlet weak var labelTitle: UILabel!
    var v :PlotView
    var shapeLayer: CAShapeLayer
    var cal:CKCalendarView
    var tableView:UITableView
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func prevButtonPushed(sender: AnyObject) {
        if dateLabel.text == "2016 年 03 月" {
            dateLabel.text = "2016 年 02 月"
        } else if dateLabel.text == "2016 年 02 月" {
            dateLabel.text = "2016 年 01 月"
        }
        tableView.reloadData()
    }
    
    @IBAction func nextButtonPushed(sender: AnyObject) {
        if dateLabel.text == "2016 年 01 月" {
           dateLabel.text = "2016 年 02 月"
        } else if dateLabel.text == "2016 年 02 月" {
           dateLabel.text = "2016 年 03 月"
        }
        tableView.reloadData()
    }
    
    func setAppearance(v:UIView) {
        v.layer.cornerRadius = 4
        // v.clipsToBounds = true
        
        
        // let shadowLayer = CALayer()
        v.layer.shadowOpacity = 0.5
        v.layer.shadowOffset = CGSize(width: 2, height: 2)
        v.layer.shadowRadius = 0.5
        
        v.layer.shadowColor = UIColor.lightGrayColor().CGColor
        
        // v.layer.addSublayer(shadowLayer)
    }

    required init?(coder aDecoder: NSCoder) {
        v = PlotView(frame: CGRect(x: -10, y: 16, width: 480, height: 350))
        shapeLayer = CAShapeLayer()
        cal = CKCalendarView()
        cal.frame = CGRectMake(39, 240, 300, 320)
        tableView = UITableView()
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
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]

        setAppearance(labelTitle)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        /*
        let backRect = CGRect(x: 20, y: 100, width: 340, height: 240)
        let back = UIView(frame: backRect)
        
        // レイヤーの作成
        let gradient = CAGradientLayer()
        
        // レイヤーサイズをビューのサイズをそろえる
        gradient.frame = back.bounds;
        
        // 開始色と終了色を設定
        gradient.colors = [
            // 開始色
            UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).CGColor,
            
            // 終了色
            UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1).CGColor,
        ]
        
        // レイヤーを追加
        back.layer.insertSublayer(gradient, atIndex:0)
        back.layer.cornerRadius = 6.0
        back.clipsToBounds = true
        self.view.addSubview(back)
        */
        
        v.backgroundColor = UIColor.clearColor()
        // self.view.addSubview(v)
        
        
        let l = UILabel(frame: CGRect(x: 200, y: 60, width: 280, height: 44))
        l.textColor = UIColor.redColor()
        l.text = "2016年4月に資金ショートします！"
        l.font = UIFont(name: "HiraKakuProN-W6", size: UIFont.systemFontSize() + 2)
        l.center = CGPoint(x: self.view.center.x + 8, y: l.center.y)
        // self.view.addSubview(l)
        
        let rect = CGRect(x: 10, y: 268, width: self.view.frame.width - 21, height: self.view.frame.height / 2 + 4)
        tableView = UITableView(frame: rect, style: UITableViewStyle.Plain)
        tableView.dataSource = self
        tableView.delegate = self
        // tableView.rowHeight = 52
        // tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.view.addSubview(tableView)
        
        tableView.registerClass(InputCell.self,  forCellReuseIdentifier:"cell")
        setAppearance(tableView)
        
        cal.delegate = self
        // self.view.addSubview(cal)
        cal.hidden = true
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return [114.0, 52, 52, 52, 114, 52, 52][indexPath.row]
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell!
        if indexPath.row == 0 || indexPath.row == 4 {
            cell = tableView.dequeueReusableCellWithIdentifier("cell2")
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("cell")
        }
        
        var a_cell:InputCell = InputCell()
        var a_cell2:InputCell2 = InputCell2()
        
        if let n_cell = cell {
            if indexPath.row == 0 || indexPath.row == 4 {
                a_cell2 = n_cell as! InputCell2
            } else {
                a_cell = n_cell as! InputCell
            }
        } else {
            if indexPath.row == 0 || indexPath.row == 4 {
                let n = InputCell2(style: UITableViewCellStyle.Value2, reuseIdentifier: "cell2")
                a_cell2 = n
            } else {
                let n = InputCell(style: UITableViewCellStyle.Value2, reuseIdentifier: "cell")
                a_cell = n
            }
        }
        
        let c:UITableViewCell
        if indexPath.row == 0 || indexPath.row == 4 {
            a_cell2.textLabel?.frame = CGRect(x: (a_cell2.textLabel?.frame.origin.x)! - 100,
                y: (a_cell2.textLabel?.frame.origin.y)!,
                width: (a_cell2.textLabel?.frame.size.width)!,
                height: (a_cell2.textLabel?.frame.size.height)!)
            if indexPath.row == 0 {
                a_cell2.label1.text = "上代"
                a_cell2.label2.text = "下代"
            } else {
                a_cell2.label1.text = "前月末"
                a_cell2.label2.text = "当月末"
            }
            c = a_cell2
            a_cell2.mainLabel.text = ["売上高", "育成手当", "施術代等\nその他売上高", "仕入高", "在庫金額", "自己消費額", "サンプル使用分"][indexPath.row]
            if dateLabel.text == "2016 年 01 月" {
                a_cell2.textField1.text = "¥164,750"
                a_cell2.textField2.text = "¥266,865"
            } else if dateLabel.text == "2016 年 02 月" {
                a_cell2.textField1.text = "¥280,560"
                a_cell2.textField2.text = "¥301,000"
            } else if dateLabel.text == "2016 年 03 月" {
                a_cell2.textField1.text = "¥311,780"
                a_cell2.textField2.text = "¥424,060"
            }
        } else {
            c = a_cell
            a_cell.textField1.text = "¥100,000"
            c.textLabel?.text = ["売上高", "育成手当", "施術代等\nその他売上高", "仕入高", "在庫金額", "自己消費額", "サンプル使用分"][indexPath.row]
            if dateLabel.text == "2016 年 01 月" {
                a_cell.textField1.text = "¥\(56 * indexPath.row+100)" + ",\(16 * indexPath.row+100)"
            } else if dateLabel.text == "2016 年 02 月" {
                a_cell.textField1.text = "¥\(64 * indexPath.row+100)" + ",\(82 * indexPath.row+100)"
            } else if dateLabel.text == "2016 年 03 月" {
                a_cell.textField1.text = "¥\(14 * indexPath.row+100)" + ",\(45 * indexPath.row+100)"
            }
        }
        
        
        return c
    }

    /*
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func calendar(calendar: CKCalendarView!, didSelectDate date: NSDate!) {
        calendar.hidden = true
    }
    */
}

