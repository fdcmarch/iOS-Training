//
//  SettingsViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/7/24.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapLogoutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "is_login")
    }
}

