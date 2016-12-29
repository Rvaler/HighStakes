//
//  LoginTableViewController.swift
//  HighStakes
//
//  Created by Rafael Valer on 26/12/16.
//  Copyright © 2016 RafaelValer. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class LoginTableViewController: UITableViewController, YTPlayerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnPlayVideo: UIButton!
    @IBOutlet weak var viewPlayer: YTPlayerView!
    @IBOutlet weak var activityIndicatorPlayer: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnLogin.radius(4)
        self.btnSignUp.radius(4)
        
        self.txtFieldPassword.delegate = self
        self.txtFieldEmail.delegate = self
        self.viewPlayer.delegate = self
        self.hideKeyboardWhenTappedScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.viewPlayer.pauseVideo()
    }
    
    // MARK:- Textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case self.txtFieldPassword:
            self.dismissKeyboard()
        default:
            _ = textField.setFocusToNextTextField(self.view)
        }
        return true
    }
    
    // MARK: - YTPlayerViewDelegate
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        self.activityIndicatorPlayer.stopAnimating()
        self.viewPlayer.playVideo()
    }
    func playerView(_ playerView: YTPlayerView, receivedError error: YTPlayerError) {
        self.activityIndicatorPlayer.stopAnimating()
        self.btnPlayVideo.isHidden = false
    }
    
    // MARK: - Actions

    @IBAction func btnPlayVideoTouchUpInside(_ sender: UIButton) {
        self.btnPlayVideo.isHidden = true
        self.activityIndicatorPlayer.startAnimating()
        let playerVars = ["playsinline": 1, "autoplay": 1, "modestbranding": 1, "showinfo": 0]
        self.viewPlayer.load(withVideoId: "ycPmjdwxIOQ", playerVars: playerVars)
    }
    
    @IBAction func btnLoginTouchUpInside(_ sender: UIButton) {
        let undo = sender.showActivityIndicator(self.btnLogin)
        User.login(self.txtFieldEmail.text, self.txtFieldPassword.text) { (user, error, message) in
            DispatchQueue.main.async(execute: {
                undo()
                if let _ = user { // log in suceeded
                    self.dismissModalStack(self, animated: true, completionBlock: nil)
                } else { // log in failed
                    self.showSimpleAlertController("Ops", message: message ?? error?.localizedDescription ?? "Something went wrong.")
                }
            })
        }
    }
    @IBAction func btnSignUpTouchUpInside(_ sender: Any) {
        self.performSegue(withIdentifier: "segueFromLoginToSignUp", sender: nil)
    }

}
