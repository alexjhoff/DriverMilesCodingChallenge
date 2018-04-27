//
//  ViewController.swift
//  DriverMilesExcercise
//
//  Created by Alex Hoff on 4/10/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import UIKit
import UberCore

class ViewController: UIViewController {
    
    let viewModel = LoginViewModel()
    let scopes: [UberScope] = [.profile, .places, .request]
    let loginManager = LoginManager(loginType: .native)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginWithoutUberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
       
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.addSubview(blurEffectView)
        
        loginButton.layer.cornerRadius = 5
    }

    @IBAction func login(_ sender: Any) {

        let uberLogin = LoginButton(frame: CGRect.zero, scopes: scopes, loginManager: loginManager)
        uberLogin.presentingViewController = self
        uberLogin.delegate = viewModel
        uberLogin.center = loginButton.center
        uberLogin.loginManager.login(requestedScopes: scopes, presentingViewController: self) { (token, error) in
            self.viewModel.loginButton(uberLogin, didCompleteLoginWithToken: token, error: error)
        }

    }
    
    @IBAction func loginWithoutUber(_ sender: Any) {
        let alert = UIAlertController(title: "Authentication Error", message: "Are you sure you want to continue without authetication?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        let signOutAction = UIAlertAction(title: "Confirm", style: .`default`, handler: { _ in
            let id = "showTabBar"
            self.performSegue(withIdentifier: id, sender: self.self)
        })
        alert.addAction(signOutAction)
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: LoginDelegate {
    func loginSuccess() {
        let id = "showTabBar"
        performSegue(withIdentifier: id, sender: self)
    }
}



