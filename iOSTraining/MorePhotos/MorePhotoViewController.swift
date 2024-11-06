//
//  MorePhotoViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/6/24.
//

import UIKit

class MorePhotoViewController: UIViewController {
    var teacher: Teacher?
    @IBOutlet weak var collectionView: UICollectionView!
    
//    private let photos = [
//        "panda","panda","panda","panda","panda","panda"
//    ]
    private var photos: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
       let nib = UINib(nibName: "PhotoCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "PhotoCell")
        
        if let teacher = teacher {
            photos = teacher.imageGallery
        }
    }
}

extension MorePhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell {
            cell.photoImageView.image = UIImage(named: photos[indexPath.row])
            
            if indexPath.row == 0 {
                cell.photoSectionLabel.text = "Section 1"
                cell.photoSectionLabel.isHidden = false
            } else if indexPath.row == 6 {
                cell.photoSectionLabel.text = "Section 2"
                cell.photoSectionLabel.isHidden = false
            } else {
                cell.photoSectionLabel.isHidden = true
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //print(indexPath.row)
        let width = indexPath.row < 6 ? 188 : 92
        let height = indexPath.row < 6 ? 150 : 120
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(
            title: "Delete Image",
            message: "Do you want to delete this image?",
            preferredStyle: .alert
        )
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) {_ in
            //print(indexPath.row)
            self.photos.remove(at: indexPath.row)
            self.collectionView.reloadData()
        }
        
        let noAction = UIAlertAction(title: "No", style: .default)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        self.present(alert, animated: true)
    }
    
    
}
