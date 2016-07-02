//
//  UIView+Extension.swift
//  RGBDiscovery
//
//  Created by Bruno da Luz on 7/2/16.
//  Copyright © 2016 bruno v0id. All rights reserved.
//

import UIKit

extension UIView {
    func animation(width: CGFloat, label: UILabel, slider: UISlider) {
        UIView.animateWithDuration(1.0) {
            label.center.x  = width / 2
            slider.center.x = width / 2
        }
    }
}
