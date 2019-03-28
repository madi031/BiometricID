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
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
            self.evaluateFaceIdAuthenticity(context: context)
        }
    }
    
    func evaluateFaceIdAuthenticity(context: LAContext) {
        let reason = "Is it really you?"
        
        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in
            if success {
                print("success!!")
            } else {
                print("Error, \(String(describing: error))")
                let alert = UIAlertController(title: "Authentication failed!!", message: "Try again", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: { (alert) in
                    // do nothing
                })
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}

