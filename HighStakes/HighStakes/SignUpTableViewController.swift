//
//  SignUpTableViewController.swift
//  HighStakes
//
//  Created by Rafael Valer on 26/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit

class SignUpTableViewController: UITableViewController {

    @IBOutlet weak var txtFieldFirstName: UITextField!
    @IBOutlet weak var txtFieldLastName: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSignUp.radius(4)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions
    
    @IBAction func btnCancelTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnSignUpTouchUpInside(_ sender: Any) {
    
        User.signUp(txtFieldEmail.text, txtFieldPassword.text, txtFieldFirstName.text, txtFieldLastName.text) { (user, error, message) in
            if let error = error {
                self.showSimpleAlertController("Ops", message: error.localizedDescription)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
