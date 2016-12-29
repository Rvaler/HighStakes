//
//  UIViewExtension.swift
//  HighStakes
//
//  Created by Rafael Valer on 27/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

extension UIView {
    // shows an activity indicator blocking buttons in your choice, 
    // must call undo to enable buttons back again
    func showActivityIndicator(_ blockingButtons: UIButton...) -> (()->()){
        
        for button in blockingButtons{
            button.isEnabled = false
        }
        
        let indicator : UIActivityIndicatorView = UIActivityIndicatorView()
        if let bg = self.backgroundColor , bg == UIColor.white {
            indicator.activityIndicatorViewStyle = .gray
        }
        
        indicator.hidesWhenStopped = true
        
        indicator.center = self.center
        self.superview?.addSubview(indicator)
        
        if let button = self as? UIButton{
            button.setTitle("", for: UIControlState.disabled)
            button.setImage(UIImage(), for: UIControlState.disabled)
            button.isEnabled = false
        }
        
        indicator.startAnimating()
        
        let undoIndicator : ()->() = {
            indicator.stopAnimating()
            indicator.removeFromSuperview()
            
            if let button = self as? UIButton{
                button.isEnabled = true
            }
            for button in blockingButtons{
                button.isEnabled = true
            }   
        }
        return undoIndicator
    }
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
