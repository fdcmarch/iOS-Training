//
//  TeacherProfileViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/5/24.
//

import UIKit
import AVKit
import AVFoundation

class TeacherProfileViewController: UIViewController {
    var teacher: Teacher?
    var playerLayer: AVPlayerLayer?
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var teacherAddressLabel: UILabel!
    @IBOutlet weak var teacherFlagLabel: UIImageView!
    @IBOutlet weak var teacherProfileImage: UIImageView!
    @IBOutlet weak var teacherCountryLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tab1Button: UIButton!
    @IBOutlet weak var tab2Button: UIButton!
    @IBOutlet weak var tab3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Teacher's Profile"
        displayTabContent(tabNumber: 1)
        setButtonBackgroundColor(tabNumber: 1)
//        if let teacher = teacher {
//           teacherNameLabel.text = teacher.name
//           teacherAddressLabel.text = teacher.address
//           teacherFlagLabel.image = UIImage(named: teacher.flag!)
//           teacherCountryLabel.text = teacher.country
//            teacherProfileImage.image = UIImage(named: teacher.imageName)
//       }
        playVideoInImageView()

        
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
    
    @IBAction func didTapTab1(_ sender: Any) {
        displayTabContent(tabNumber: 1)
        setButtonBackgroundColor(tabNumber: 1)
    }
    @IBAction func didTapTab2(_ sender: Any) {
        displayTabContent(tabNumber: 2)
        setButtonBackgroundColor(tabNumber: 2)
    }
    @IBAction func didTapTab3(_ sender: Any) {
        displayTabContent(tabNumber: 3)
        setButtonBackgroundColor(tabNumber: 3)
    }
    
    func playVideoInImageView() {
        guard let videoURL = Bundle.main.url(forResource: "sample", withExtension: "mp4") else {
            print("Video file not found")
            return
        }
        
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = teacherProfileImage.bounds
        playerLayer.videoGravity = .resizeAspectFill
        teacherProfileImage.layer.addSublayer(playerLayer)
        player.play()
    }
    
    func displayTabContent(tabNumber: Int) {
           switch tabNumber {
           case 1:
               textView.text = "This is content for Tab 1. You can add more detailed information here."
           case 2:
               textView.text = "This is content for Tab 2. Update the content as required."
           case 3:
               textView.text = "This is content for Tab 3. Modify this content according to your needs."
           default:
               textView.text = "Default content for the tabs."
           }
       }
    func setButtonBackgroundColor(tabNumber: Int) {
        tab1Button.backgroundColor = nil
        tab2Button.backgroundColor = nil
        tab3Button.backgroundColor = nil
        
            switch tabNumber {
            case 1:
                tab1Button.backgroundColor = .lightGray
            case 2:
                tab2Button.backgroundColor = .lightGray
            case 3:
                tab3Button.backgroundColor = .lightGray
            default:
                break
            }
        }
}
