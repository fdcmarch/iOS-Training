//
//  PhotoCell.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/6/24.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var photoSectionLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        photoSectionLabel.isHidden = true
        photoImageView.layer.cornerRadius = 12
        photoImageView.layer.masksToBounds = true
    }

}
