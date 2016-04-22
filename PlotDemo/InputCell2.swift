//
//  InputCell2.swift
//  PlotDemo
//
//  Created by OKAZAKI Yasuo on 2016/01/29.
//  Copyright © 2016年 F&Mnet. All rights reserved.
//

import Foundation

class InputCell2 : UITableViewCell {
    
    var label1:UILabel
    var label2:UILabel
    
    var textField1:UITextField
    var textField2:UITextField
    
    var mainLabel:UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        label1 = UILabel(frame: CGRect(x: 76, y: 0, width: 60, height: 60))
        label1.font = UIFont.systemFontOfSize(14)
        label1.textColor = UIColor.darkGrayColor()
        
        label2 = UILabel(frame: CGRect(x: 76, y: 56, width: 60, height: 60))
        label2.font = UIFont.systemFontOfSize(14)
        label2.textColor = UIColor.darkGrayColor()
        
        textField1 = UITextField(frame: CGRect(x: 250, y: 10, width: 100, height: 44))
        textField1.font = UIFont(name: "Courier-Bold", size: 18)
        textField2 = UITextField(frame: CGRect(x: 250, y: 66, width: 100, height: 44))
        textField2.font = UIFont(name: "Courier-Bold", size: 18)
        
        mainLabel = UILabel(frame: CGRect(x: 15, y: 26, width: 60, height: 60))
        mainLabel.font = UIFont.systemFontOfSize(14)
        mainLabel.textColor = UIColor.darkGrayColor()

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.textLabel?.font = UIFont.systemFontOfSize(14)
        self.textLabel?.textColor = UIColor.darkGrayColor()
        self.textLabel?.numberOfLines = 2
        
        self.contentView.addSubview(mainLabel)
        self.contentView.addSubview(label1)
        self.contentView.addSubview(label2)
        
        self.contentView.addSubview(textField1)
        self.contentView.addSubview(textField2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let context:CGContextRef! = UIGraphicsGetCurrentContext()
        UIColor.lightGrayColor().colorWithAlphaComponent(0.5).setStroke()
        CGContextMoveToPoint(context, 130, 2)
        CGContextAddLineToPoint(context, 130, self.bounds.size.height - 2)
        CGContextStrokePath(context)
    }
}