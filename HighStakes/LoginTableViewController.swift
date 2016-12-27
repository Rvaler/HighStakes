//
//  LoginTableViewController.swift
//  HighStakes
//
//  Created by Rafael Valer on 26/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnLogin.radius(4)
        self.btnSignUp.radius(4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    
    @IBAction func btnLoginTouchUpInside(_ sender: Any) {
        User.login(self.txtFieldEmail.text, self.txtFieldPassword.text) { (user, error, message) in
            if let user = user { // log in suceeded
                self.performSegue(withIdentifier: "segueFromLoginToMainApp", sender: user)
            } else { // log in failed
                self.showSimpleAlertController("Ops", message: error?.localizedDescription ?? "Something went wrong.")
            }
        }
    }
    @IBAction func btnSignUpTouchUpInside(_ sender: Any) {
        self.performSegue(withIdentifier: "segueFromLoginToSignUp", sender: nil)
    }

}
