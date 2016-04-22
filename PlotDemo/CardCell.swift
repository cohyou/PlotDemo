//
//  CardCell.swift
//  PlotDemo
//
//  Created by OKAZAKI Yasuo on 2016/01/28.
//  Copyright © 2016年 F&Mnet. All rights reserved.
//

import Foundation

class CardCell : UITableViewCell {
    
    let dateLabel:UILabel
    let amountLabel:UILabel
    
    let contentLabel:UILabel
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        dateLabel = UILabel(frame: CGRect(x: 12, y: -1, width: 60, height: 60))
        amountLabel = UILabel(frame: CGRect(x: 260, y: -1, width: 120, height: 60))
        contentLabel = UILabel(frame: CGRect(x: 72, y: -12, width: 200, height: 60))
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let rect = CGRect(
            x: self.bounds.origin.x + 1,
            y: self.contentView.bounds.origin.y,
            width: self.bounds.size.width + 34.5,
            height: self.bounds.size.height + 12)
        
        let v = CardView(frame: CGRectInset(rect, 0, 2))
        // let v = CardView(frame: rect)
        // v.backgroundColor = UIColor.redColor()
        self.contentView.addSubview(v)
        
        self.backgroundColor = UIColor.clearColor()
        
        
        self.contentView.addSubview(dateLabel)
        
        dateLabel.textColor = UIColor.darkGrayColor()
        dateLabel.font = UIFont.boldSystemFontOfSize(18)
        dateLabel.font = UIFont(name: "Avenir-Heavy", size: 18)
        
        self.contentView.addSubview(amountLabel)
        amountLabel.textColor = UIColor.darkGrayColor()
        amountLabel.font = UIFont.boldSystemFontOfSize(18)
        amountLabel.font = UIFont(name: "Avenir-Heavy", size: 16)
        
        self.contentView.addSubview(contentLabel)
        contentLabel.textColor = UIColor.darkGrayColor()
        contentLabel.font = UIFont.systemFontOfSize(15)
        // contentLabel.font = UIFont(name: "Avenir-Heavy", size: 18)
    }

    required init?(coder aDecoder: NSCoder) {
        dateLabel = UILabel(frame: CGRect(x: 12, y: -1, width: 60, height: 60))
        amountLabel = UILabel(frame: CGRect(x: 100, y: -1, width: 60, height: 60))
        contentLabel = UILabel(frame: CGRect(x: 72, y: -1, width: 200, height: 60))
        super.init(coder: aDecoder)
        let v = CardView(frame: self.contentView.bounds)
        self.contentView.addSubview(v)
    }
}