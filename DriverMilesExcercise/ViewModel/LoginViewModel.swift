//
//  LoginViewModel.swift
//  DriverMilesExcercise
//
//  Created by Alex Hoff on 4/10/18.
//  Copyright © 2018 Alex Hoff. All rights reserved.
//

import Foundation
import UberCore

protocol LoginDelegate {
    func loginSuccess()
}

class LoginViewModel: NSObject {
    var delegate: LoginDelegate?
}

// Mark: LoginButtonDelegate
extension LoginViewModel: LoginButtonDelegate {
    func loginButton(_ button: LoginButton, didLogoutWithSuccess success: Bool) {
        // success is true if logout succeeded, false otherwise
    }
    
    func loginButton(_ button: LoginButton, didCompleteLoginWithToken accessToken: AccessToken?, error: NSError?) {
        if let token = accessToken {
            // AccessToken Saved
            DataStore.shared.storeToken(token.tokenString)
            delegate?.loginSuccess()
        } else if let error = error {
            // An error occured
            print("Login Error", error)
        }
    }
}
