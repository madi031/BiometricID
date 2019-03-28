//
//  ViewController.swift
//  FaceIDApp
//
//  Created by madi on 3/27/19.
//  Copyright © 2019 com.madi.faceid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let touchMe = BiometricIDAuthentication()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func autheticateTapped(_ sender: Any) {
        loginAction()
    }
    
    func loginAction() {
        touchMe.autheticateUser { [weak self] message in
            if let message = message {
                let alertView = UIAlertController(title: "Oops!!", message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Darn!", style: .default)
                alertView.addAction(okAction)
                self?.present(alertView, animated: true, completion: nil)
            } else {
                let alertView = UIAlertController(title: "Yay!!", message: "Face/Touch ID success", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Hurray!", style: .default)
                alertView.addAction(okAction)
                self?.present(alertView, animated: true, completion: nil)
            }
        }
    }
    
}

