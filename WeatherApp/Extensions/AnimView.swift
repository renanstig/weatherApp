//
//  AnimView.swift
//  WeatherApp
//
//  Created by Renan Camaforte on 22.02.19.
//  Copyright © 2019 Renan Camaforte. All rights reserved.
//

import UIKit

class AnimView: UIView {
    
    enum Direction: Int {
        case fromLeft = 0
        case fromRight = 1
    }
    
    @IBInspectable var direction: Int = 0
    @IBInspectable var delay: Double = 0.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initAnim()
        UIView.animate(withDuration: 2, delay: delay, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            if let s = self.superview {
                if self.direction == Direction.fromLeft.rawValue {
                    self.center.x += s.bounds.width
                } else {
                    self.center.x -= s.bounds.width
                }
            }
            self.alpha = 1
        }, completion: nil)
    }
    
    func initAnim() {
        if let s = self.superview {
            if direction == Direction.fromLeft.rawValue {
                self.center.x -= s.bounds.width
            } else {
                self.center.x += s.bounds.width
            }
        }
    }

}
