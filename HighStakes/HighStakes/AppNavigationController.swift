//
//  AppNavigationController.swift
//  HighStakes
//
//  Created by Rafael Valer on 27/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    @IBInspectable var barTintColor : UIColor = UIColor.App_Orange {
        didSet{
            self.navigationBar.barTintColor = self.barTintColor
        }
    }
    @IBInspectable var tintColor : UIColor = UIColor.white {
        didSet{
            self.navigationBar.tintColor = self.tintColor
        }
    }
    @IBInspectable var textColor : UIColor = UIColor.white {
        didSet{
            self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: self.textColor]
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: self.textColor]
        self.navigationBar.tintColor = self.tintColor
        self.navigationBar.barTintColor = self.barTintColor
        self.navigationBar.isTranslucent = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
