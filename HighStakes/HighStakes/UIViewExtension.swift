//
//  UIViewExtension.swift
//  HighStakes
//
//  Created by Rafael Valer on 27/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Layout
    func radius(_ radius : CGFloat? = nil){
        DispatchQueue.main.async {
            if let radius = radius {
                self.layer.cornerRadius = radius
            } else {
                self.layer.cornerRadius = (self.frame.size.height < self.frame.size.width) ? self.frame.size.height / 2 : self.frame.size.width / 2
            }
            self.layer.masksToBounds = true
        }
    }

}
