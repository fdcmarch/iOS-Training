//
//  ViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        signUpBtn.layer.cornerRadius = 12
        signUpBtn.layer.borderWidth = 1
        signUpBtn.layer.borderColor = UIColor.purple.cgColor
        signInBtn.layer.cornerRadius = 12
    }

    @IBAction func rememberMe_Tapped(_ sender:UIButton){
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    
    
    @IBAction func didTapForgotPwd(_ sender: Any) {
        let forgotPassVC = ForgotPasswordViewController()
        self.navigationController?.pushViewController(forgotPassVC, animated: true)
    }
    @IBAction func didTapSignUp(_ sender: Any) {
        // Initialize SignUpViewController from its XIB file
//            let signUpVC = SignUpViewController(nibName: "SignUpViewController", bundle: nil)
//             
//            // Present the SignUpViewController modally
//        signUpVC.modalPresentationStyle = .fullScreen // Optional: Makes it cover the entire screen
        let signUpVC = SignUpViewController()
        let nav = UINavigationController(rootViewController: signUpVC)
        self.present(nav, animated: true, completion: nil)
    }
    
    @IBAction func didTapSubmitButton(_ sender: Any) {
        let homeVC = HomeViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
}

