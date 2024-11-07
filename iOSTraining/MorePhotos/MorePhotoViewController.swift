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
    
    private var section1Photos = ["panda", "taylor", "chung", "maja", "taylor", "panda"]
    private var section2Photos = ["sjw", "mikha", "taylor", "chung", "panda", "taylor", "chung", "maja", "sjw", "mikha", "taylor", "chung"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
       let nib = UINib(nibName: "PhotoCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "PhotoCell")
        
    }
}

extension MorePhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? section1Photos.count : section2Photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell {
            let photo = indexPath.section == 0 ? section1Photos[indexPath.row] : section2Photos[indexPath.row]
            cell.photoImageView.image = UIImage(named: photo)
            
            cell.photoSectionLabel.isHidden = indexPath.row != 0
            cell.photoSectionLabel.text = indexPath.section == 0 ? "Section 1" : "Section 2"
            return cell
        }
        return UICollectionViewCell()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //print(indexPath.row)
        let width = indexPath.section == 0 ? 188 : 92
        let height = indexPath.section == 0 ? 150 : 120
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
            if indexPath.section == 0 {
                self.section1Photos.remove(at: indexPath.row)
            } else {
                self.section2Photos.remove(at: indexPath.row)
            }
            self.collectionView.reloadData()
        }
        
        let noAction = UIAlertAction(title: "No", style: .default)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        self.present(alert, animated: true)
    }
    
    
}
