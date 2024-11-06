//
//  HomeViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/5/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let teachers : [Teacher] = [
        Teacher(imageName: "chung", name: "Chung Myung", status: "0", address: "Luzon", rating: "5.00", lesson: "500", coin: "500", flag: "phil", country: "Pilipinas", tag: ["buotan", "mabait"], imageGallery: ["panda", "taylor", "chung", "maja", "taylor", "panda", "sjw", "mikha", "taylor", "chung", "panda", "taylor", "chung", "maja", "sjw", "mikha", "taylor", "chung"]),
            Teacher(imageName: "mikha", name: "Mikha", status: "1", address: "Visayas", rating: "4.00", lesson: "700", coin: "500", flag: "phil", country: "Pilipinas", tag: ["buotan", "mabait"], imageGallery: ["panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja"]),
            Teacher(imageName: "taylor", name: "Taylor", status: "1", address: "Cebu", rating: "4.00", lesson: "100", coin: "700", flag: "phil", country: "Pilipinas", tag: ["buotan", "mabait"], imageGallery: ["panda", "taylor", "gonpachiro", "panda", "taylor"]),
            Teacher(imageName: "sjw", name: "Sung Jin-woo", status: "0", address: "Bohol", rating: "5.00", lesson: "200", coin: "700", flag: "usa", country: "America", tag: ["buotan", "mabait"], imageGallery: ["gonpachiro", "panda", "taylor", "panda", "taylor"]),
            Teacher(imageName: "gonpachiro", name: "Tanjiro", status: "0", address: "Japan", rating: "5.00", lesson: "100", coin: "100", flag: "phil", country: "Skina Kamputhaw", tag: ["buotan", "mabait"], imageGallery: ["panda", "taylor"]),
            Teacher(imageName: "maja", name: "Traaaaining??", status: "0", address: "Tokyo", rating: "5.00", lesson: "9900", coin: "2000", flag: "usa", country: "Skina Japan", tag: ["buotan", "mabait"], imageGallery: ["panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja", "panda", "maja"]),
            Teacher(imageName: "panda", name: "Pandaman", status: "1", address: "Lahug", rating: "5.00", lesson: "5000", coin: "2000", flag: "usa", country: "IT Park", tag: ["buotan", "mabait"], imageGallery: ["panda", "taylor", "sjw", "gonpachiro", "maja", "panda"])
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "TeacherCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TeacherCell")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherCell", for: indexPath) as? TeacherCell {
            
            let teacher = teachers[indexPath.row]
            cell.teacherName.text = teacher.name
            cell.teacherAddress.text = teacher.address
            cell.teacherRating.text = teacher.rating
            cell.teacherLesson.text = teacher.lesson
            cell.teacherCoin.text = teacher.coin
            cell.teacherImage.image = UIImage(named: teacher.imageName)
            cell.teacherFlag.image = UIImage(named: teacher.flag!)
            cell.teacherTag.text = teacher.tag.joined(separator: ", ")
            if teacher.status == "1" {
                cell.teacherStatus.image = UIImage(named: "active")
            } else {
                cell.teacherStatus.image = UIImage(named: "offline")
            }
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTeacher = teachers[indexPath.row]
        let teacherProfileVC = TeacherProfileViewController()
        teacherProfileVC.teacher = selectedTeacher
        navigationController?.pushViewController(teacherProfileVC, animated: true)
    }
}
