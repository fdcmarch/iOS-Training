//
//  ProductCell.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/8/24.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productImageView.layer.cornerRadius = 12
        productImageView.layer.masksToBounds = true
    }

}
