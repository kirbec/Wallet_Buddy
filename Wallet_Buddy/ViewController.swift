//
//  ViewController.swift
//  Wallet_Buddy
//
//  Created by adrewno1 on 2/21/17.
//  Copyright © 2017 adrewno1. All rights reserved.
//

import UIKit
import AKPickerView
import LocalAuthentication

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        let context: LAContext = LAContext()
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Touch ID", reply:
                {(wasSuccessful, error) in
                    if wasSuccessful
                    {
                        self.performSegue(withIdentifier: "authorized", sender: self)
                    }
                    else
                    {
                        print(error?.localizedDescription)
                    }
            })
        }

    }
    
}

