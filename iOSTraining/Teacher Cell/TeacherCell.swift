//
//  TeacherCell.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/5/24.
//

import UIKit

class TeacherCell: UITableViewCell {

    @IBOutlet weak var teacherImage: UIImageView!
    @IBOutlet weak var teacherAddress: UILabel!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var teacherRating: UILabel!
    @IBOutlet weak var teacherLesson: UILabel!
    @IBOutlet weak var teacherCoin: UILabel!
    @IBOutlet weak var teacherTag: UILabel!
    @IBOutlet weak var teacherFlag: UIImageView!
    @IBOutlet weak var teacherStatus: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //murag css
        teacherTag.layer.cornerRadius = 6
        teacherTag.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
