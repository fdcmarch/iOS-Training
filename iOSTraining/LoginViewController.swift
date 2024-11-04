//
//  ViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        signupBtn.layer.cornerRadius = 12
        signupBtn.layer.borderWidth = 1
        signupBtn.layer.borderColor = UIColor.purple.cgColor
        signInBtn.layer.cornerRadius = 12
    }

    @IBAction func rememberMe_Tapped(_ sender:UIButton){
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    
    @IBAction func didTapSignupButton(_ sender: Any) {
        print("Sign Up button was tapped.")
        // Initialize SignUpViewController from its XIB file
            let signupVC = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
            
            // Present the SignUpViewController modally
            signupVC.modalPresentationStyle = .fullScreen // Optional: Makes it cover the entire screen
            self.present(signupVC, animated: true, completion: nil)
    }
    
}

