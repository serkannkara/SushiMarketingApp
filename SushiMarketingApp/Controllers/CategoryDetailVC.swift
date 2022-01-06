//
//  CategoryDetailVC.swift
//  SushiMarketingApp
//
//  Created by Serkan on 5.01.2022.
//

import UIKit

class CategoryDetailVC: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var productList = [Product]()
    
    var category:Category?
    
    var chosenProduct:Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let c = category {
            navigationItem.title = c.categoryName
            
            productList = Productdao().fetchProduct(category_id: c.categoryId!)
        }

        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        let tasarim :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.categoryCollectionView.frame.size.width
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let hucreGenislik = (genislik-30)/2
        
        tasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.6)
        
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        
        categoryCollectionView.collectionViewLayout = tasarim
        
    }
}



extension CategoryDetailVC: UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let products = productList[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductsCollectionViewCell
        
        cell.productImageView.image = UIImage(named: products.productImageName!)
        cell.productLabel.text = products.productName
        if let price = products.productPrice {
            cell.productFiyat.text = String(price)
        }
        
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 4
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.shadowColor = UIColor.systemGray5.cgColor
        cell.layer.shadowOffset = CGSize(width: 30.0, height: 30.0)
        cell.layer.shadowRadius = 30.0
        cell.layer.shadowOpacity = 20.0
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenProduct = productList[indexPath.row]
        
        self.performSegue(withIdentifier: "toProductDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProductDetail" {
            let destinationVC = segue.destination as! ProductDetailVC
            destinationVC.selectedProduct = chosenProduct
        }
    }
    
    
    
}
