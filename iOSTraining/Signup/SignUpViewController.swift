//
//  SignUpViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/4/24.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var signInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        signUpBtn.layer.cornerRadius = 12
        signInBtn.layer.cornerRadius = 12
        signInBtn.layer.borderWidth = 1
        signInBtn.layer.borderColor = UIColor.purple.cgColor
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func didTappedPrivacy(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
}
