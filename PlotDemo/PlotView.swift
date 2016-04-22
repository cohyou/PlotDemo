//
//  PlotView.swift
//  PlotDemo
//
//  Created by OKAZAKI Yasuo on 2016/01/25.
//  Copyright © 2016年 F&Mnet. All rights reserved.
//

import UIKit

class PlotView: UIView {
    
    let plotLayer1:CAShapeLayer
    let plotLayer2:CAShapeLayer
    
    var circles:[UIBezierPath]
    
    required init?(coder aDecoder: NSCoder) {
        plotLayer1 = CAShapeLayer()
        plotLayer1.backgroundColor = UIColor.clearColor().CGColor
        plotLayer2 = CAShapeLayer()
        plotLayer2.backgroundColor = UIColor.clearColor().CGColor
        circles = []
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
    }
    
    override init(frame: CGRect) {
        plotLayer1 = CAShapeLayer()
        plotLayer1.backgroundColor = UIColor.clearColor().CGColor
        plotLayer2 = CAShapeLayer()
        plotLayer2.backgroundColor = UIColor.clearColor().CGColor
        circles = []
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    func anim(layer:CAShapeLayer, values:[CGFloat]) {
        let newPath = pathForVaues(values)
        layer.path = newPath.CGPath
        
        let anim = CABasicAnimation(keyPath:"path")
        anim.fromValue = UIBezierPath(CGPath: layer.path!);
        anim.toValue = newPath;
        anim.duration = 0.5;
        layer.addAnimation(anim, forKey: nil)
        
        for circle in circles {
            UIColor(CGColor: layer.fillColor!).colorWithAlphaComponent(1).setFill()
            circle.fill()
        }
    }
    
    func setPlotValue() {
        anim(plotLayer1, values: [180, 70, 90, 150, 120, 10, 160])
        anim(plotLayer2, values: [160, 60, 100, 130, 120, 0, 70])
    }
    
    func pathForVaues(values:[CGFloat]) -> UIBezierPath {
        let zeroline:CGFloat = 300
        
        let plotPath1 = UIBezierPath()
        plotPath1.moveToPoint(CGPoint(x: 350, y: zeroline))
        plotPath1.addLineToPoint(CGPoint(x: 50, y: zeroline))

        var x:CGFloat = 0
        circles = []
        for value in values {
            x += 50
            plotPath1.addLineToPoint(CGPoint(x: x, y: zeroline - value))
            
            var point = CGPoint(x:x, y:zeroline - value)
            point.x -= 5.0/2
            point.y -= 5.0/2
            
            // let circle = UIBezierPath(ovalInRect:CGRect(origin: point, size: CGSize(width: 5.0, height: 5.0)))
            // circles.append(circle)
        }
        plotPath1.closePath()
        
        return plotPath1
    }
    
    override func drawRect(rect: CGRect) {
        
        let context:CGContextRef! = UIGraphicsGetCurrentContext()
        
        CGContextSetLineWidth(context, 2.0)
        
        let values1:[CGFloat] = [200, 50, 80, 170, 160, 20, 110]
        plotLayer1.path = pathForVaues(values1).CGPath
        plotLayer1.fillColor = UIColor.redColor().colorWithAlphaComponent(0.5).CGColor
        self.layer.addSublayer(plotLayer1)
        
        var circles1:[UIBezierPath] = []
        
        for circle in circles {
            circles1.append(circle)
        }

        let values2:[CGFloat] = [180, 10, 20, 150, 100, -20, 50]
        plotLayer2.path = pathForVaues(values2).CGPath
        plotLayer2.fillColor = UIColor.yellowColor().colorWithAlphaComponent(0.5).CGColor
        self.layer.addSublayer(plotLayer2)
        
        for circle in circles1 {
            UIColor.redColor().setFill()
            circle.fill()
        }

        for circle in circles {
            UIColor.yellowColor().setFill()
            circle.fill()
        }
    }
}