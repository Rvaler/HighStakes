//
//  UITextFieldDelegate.swift
//  HighStakes
//
//  Created by Rafael Valer on 29/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func setFocusToNextTextField(_ superView : UIView) -> Bool{
        if self.tag > 0{
            
            if let nextView = superView.viewWithTag(self.tag+1) as? UITextField
                , nextView.canBecomeFirstResponder
            {
                nextView.becomeFirstResponder()
            }else{
                superView.endEditing(true)
                return false
            }
        }
        return true
    }
    func setFocusToNextTextField() -> Bool{
        if self.tag > 0{
            if let superview = self.superview
            {
                if let nextView = superview.viewWithTag(self.tag+1) as? UITextField
                    , nextView.canBecomeFirstResponder
                {
                    nextView.becomeFirstResponder()
                }else{
                    superview.endEditing(true)
                    return false
                }
            }
        }
        return true
    }
}
