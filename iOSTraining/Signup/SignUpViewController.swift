//
//  SignUpViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/4/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpButtonDesign: UIButton!
    @IBOutlet weak var signInButtonDesign: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        signInButtonDesign.layer.cornerRadius = 12
        signInButtonDesign.layer.borderWidth = 1
        signInButtonDesign.layer.borderColor = UIColor.purple.cgColor
        signUpButtonDesign.layer.cornerRadius = 12
        
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(didTapCloseButton)
        )
        self.navigationItem.rightBarButtonItem = closeButton
        
}
    
    @IBAction func didTappedPrivacy(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    @IBAction func didTapSignInButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapBackIconToSignin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @objc private func didTapCloseButton(){
        self.dismiss(animated: true, completion: nil)
    }
}
