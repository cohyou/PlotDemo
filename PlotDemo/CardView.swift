//
//  CardView.swift
//  PlotDemo
//
//  Created by OKAZAKI Yasuo on 2016/01/28.
//  Copyright © 2016年 F&Mnet. All rights reserved.
//

import Foundation

class CardView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 2
        
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 0.5
        
        self.layer.shadowColor = UIColor.lightGrayColor().CGColor
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = UIColor.whiteColor()
        self.layer.cornerRadius = 2
        
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 0.5
        
        self.layer.shadowColor = UIColor.lightGrayColor().CGColor
    }
}