//
//  ViewController.swift
//  FaceIDApp
//
//  Created by madi on 3/27/19.
//  Copyright © 2019 com.madi.faceid. All rights reserved.
//

import LocalAuthentication
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func autheticateTapped(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        
        // check device is capable of supporting biometric authentication
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // This reason is for touch ID. The reason for Face ID is in info.plist
            let reason = "Is it really you?"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [unowned self] (success, autheticationError) in
                DispatchQueue.main.async {
                    if success {
                        print("Sucess!!")
                    } else {
                        // error
                        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason, reply: { [unowned self] (success, autheticationError) in
                            guard success else {
                                DispatchQueue.main.async {
                                    let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                                    self.present(ac, animated: true)
                                }
                                return
                            }
                            DispatchQueue.main.async {
                                print("Success!!")
                            }
                        })
                    }
                }
            }
        } else {
            let reason = "Is it really you?"
            // no biometry
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason, reply: { [unowned self] (success, autheticationError) in
                if success {
                    print("Success!!")
                } else {
                    let ac = UIAlertController(title: "Authentication failed", message: "You could not be verified; please try again.", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(ac, animated: true)
                }
            })
        }
    }
    
}

