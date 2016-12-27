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
    @IBOutlet weak var viewPlayerContent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnLogin.radius(4)
        self.btnSignUp.radius(4)
        
        self.hideKeyboardWhenTappedScreen()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions

    @IBAction func btnPlayVideoTouchUpInside(_ sender: Any) {
        let webView = UIWebView(frame: self.viewPlayerContent.frame)
        webView.backgroundColor = UIColor.App_Orange
        self.view.addSubview(webView)
        self.view.bringSubview(toFront: webView)
        
        webView.allowsInlineMediaPlayback = true
        webView.mediaPlaybackRequiresUserAction = false
        webView.isOpaque = false
        
        let videoID = "ycPmjdwxIOQ" // https://www.youtube.com/watch?v=zN-GGeNPQEg
        
        let embededHTML = "<html><body style='margin:0px;padding:0px;'><script type='text/javascript' src='http://www.youtube.com/iframe_api'></script><script type='text/javascript'>function onYouTubeIframeAPIReady(){ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})}function onPlayerReady(a){a.target.playVideo();}</script><iframe id='playerId' type='text/html' width='\(webView.frame.size.width)' height='\(webView.frame.size.height)' src='http://www.youtube.com/embed/\(videoID)?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'></body></html>"
        
        webView.loadHTMLString(embededHTML, baseURL: Bundle.main.resourceURL)
    }
    
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
