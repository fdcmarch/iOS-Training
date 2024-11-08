//
//  ProductViewController.swift
//  iOSTraining
//
//  Created by FDC-CrisMarch on 11/8/24.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    private var productResponse: ProductResponse?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Products"
        
        let nib = UINib(nibName: "ProductCell", bundle: nil)
        productCollectionView.register(nib, forCellWithReuseIdentifier: "ProductCell")
        
        fetchAllProduct()
    }

    
    func fetchAllProduct () {
        NetworkManager.shared.getAllProductsNativeWay {
            products in 
            guard let products else { return }
            self.productResponse = products
            DispatchQueue.main.async {
                self.productCollectionView.reloadData()
            }
        }
    }
}

extension ProductViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productResponse?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell {
            let product = productResponse?.products[indexPath.row]
            cell.productName.text = product?.title
            cell.productPrice.text = String(format: "$%.2f", product!.price)
            cell.productImageView.image = UIImage(named: "panda")
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 215, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

