//
//  GradientView.swift
//  WeeklySummary
//
//  Created by user on 4/16/19.
//  Copyright © 2019 user. All rights reserved.
//

import UIKit
import CoreGraphics

class GradientView: UIView {

    var startColor:UIColor = .red
    var endColor:UIColor = .yellow
   
    override class var layerClass:AnyClass{
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [startColor.cgColor, endColor.cgColor]
    }
    
}
