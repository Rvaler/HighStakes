//
//  UIViewControllerExtension.swift
//  HighStakes
//
//  Created by Rafael Valer on 26/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showSimpleAlertController(_ title: String?, message: String?, action: ((UIAlertAction) -> Void)? = nil) {
        let alertC = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alertC.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: action))
        
        self.present(alertC, animated: true, completion: nil)
    }
    
}

