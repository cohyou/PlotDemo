//
//  InputCell.swift
//  PlotDemo
//
//  Created by OKAZAKI Yasuo on 2016/01/29.
//  Copyright © 2016年 F&Mnet. All rights reserved.
//

import Foundation

class InputCell : UITableViewCell {
    var textField1:UITextField
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        textField1 = UITextField(frame: CGRect(x: 250, y: 4, width: 100, height: 44))
        textField1.font = UIFont(name: "Courier-Bold", size: 18)

        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.font = UIFont.systemFontOfSize(14)
        self.textLabel?.textColor = UIColor.darkGrayColor()
        self.textLabel?.numberOfLines = 2
        
        self.contentView.addSubview(textField1)
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