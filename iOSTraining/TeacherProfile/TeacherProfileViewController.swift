//
//  TeacherProfileViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/5/24.
//

import UIKit

class TeacherProfileViewController: UIViewController {
    var teacher: Teacher?
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var teacherAddressLabel: UILabel!
    @IBOutlet weak var teacherFlagLabel: UIImageView!
    @IBOutlet weak var teacherProfileImage: UIImageView!
    @IBOutlet weak var teacherCountryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Teacher's Profile"
        if let teacher = teacher {
           teacherNameLabel.text = teacher.name
           teacherAddressLabel.text = teacher.address
           teacherFlagLabel.image = UIImage(named: teacher.flag!)
           teacherCountryLabel.text = teacher.country
            teacherProfileImage.image = UIImage(named: teacher.imageName)
       }
    }
    @IBAction func didTapViewMore(_ sender: Any) {
        let morePhotoVC = MorePhotoViewController()
        morePhotoVC.teacher = teacher
        self.navigationController?.pushViewController(morePhotoVC, animated: true)
    }
    @IBAction func didTapFavoriteBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
}
