//
//  MainViewController.swift
//  HighStakes
//
//  Created by Rafael Valer on 26/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var btnVisitSite: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setLayout(){
        guard let user = User.current() else {
            return
        }
        self.lblWelcome.text = "Welcome \(user.fullName ?? "Unknown")"
    }
    
    // MARK: - Actions
    
    @IBAction func btnVisitSiteTouchUpInside(_ sender: Any) {
        UIApplication.shared.openURL(NSURL(string:"http://www.hsacademy.com.br/") as! URL)
    }
    @IBAction func btnLogoutTouchUpInside(_ sender: Any) {
        User.logOutInBackground { (error) in
            if let error = error { // logout failed
                self.showSimpleAlertController("Ops", message: error.localizedDescription)
            } else { // logout succeeded
                self.dismissModalStack(self, animated: true, completionBlock: nil)
            }
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
