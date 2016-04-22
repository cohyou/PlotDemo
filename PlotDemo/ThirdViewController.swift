//
//  ThirdViewController.swift
//  PlotDemo
//
//  Created by OKAZAKI Yasuo on 2016/01/29.
//  Copyright © 2016年 F&Mnet. All rights reserved.
//

import UIKit

class ThirdViewController : UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var labelSummary: UILabel!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        // setAppearance(view1)
        setAppearance(label1)
        setAppearance(label2)
        setAppearance(label3)
        setAppearance(label4)
        setAppearance(labelSummary)
    }
    
    override func viewWillAppear(animated: Bool) {
    }
}