//
//  RoundedView.swift
//  ABUIKit
//
//  Created by Alexandre Barbier on 25/08/14.
//  Copyright (c) 2014 abarbier. All rights reserved.
//

import UIKit

extension UIView {

    public func rounded() -> Void {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = true
    }
    
    public func rounded(radius:CGFloat) -> Void {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    public func circle() -> Void {
        
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.masksToBounds = true
    }
    
    public func removeRoundCorner() {
        self.layer.mask = nil
    }

    public func roundedBottom(radius:CGFloat) -> Void {
        let bottomShape = CAShapeLayer(layer:self.layer)

        bottomShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners:[ .BottomRight, .BottomLeft] , cornerRadii: CGSizeMake(radius, radius)).CGPath
        
        self.layer.mask = bottomShape
        self.layer.masksToBounds = true
    }
    
    public func roundedTop(radius:CGFloat) -> Void {
        let bottomShape = CAShapeLayer(layer:self.layer)
        bottomShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.TopRight, .TopLeft] , cornerRadii: CGSizeMake(radius, radius)).CGPath
        self.layer.mask = bottomShape
        self.layer.masksToBounds = true
    }
    
    public func roundedLeft(radius:CGFloat) -> Void {
        let bottomShape = CAShapeLayer(layer:self.layer)
        bottomShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.TopLeft, .BottomLeft] , cornerRadii: CGSizeMake(radius, radius)).CGPath
        self.layer.mask = bottomShape
        self.layer.masksToBounds = true
    }
    
    public func roundedRight(radius:CGFloat) -> Void {
        let bottomShape = CAShapeLayer(layer:self.layer)
        bottomShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.TopRight, .BottomRight] , cornerRadii: CGSizeMake(radius, radius)).CGPath
        self.layer.mask = bottomShape
        self.layer.masksToBounds = true
    }
    
    public func border(color:UIColor, width : CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.CGColor
    }
    
}