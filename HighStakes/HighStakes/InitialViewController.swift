//
//  InitialViewController.swift
//  HighStakes
//
//  Created by Rafael Valer on 27/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    enum Segue : String {
        case ToLogin = "segueToLogin"
        case ToMain = "segueToMain"
        
        func performIn(_ vc: UIViewController) {
            vc.performSegue(withIdentifier: self.rawValue, sender: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = User.current() {
            Segue.ToMain.performIn(self)
        } else {
            Segue.ToLogin.performIn(self)
        }
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
