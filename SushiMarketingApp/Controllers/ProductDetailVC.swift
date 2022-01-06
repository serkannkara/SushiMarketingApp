//
//  ProductDetailVC.swift
//  SushiMarketingApp
//
//  Created by Serkan on 5.01.2022.
//

import UIKit

class ProductDetailVC: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    var selectedProduct:Product?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let c = selectedProduct {
            navigationItem.title = c.productName
            
        }

        productImageView.image = UIImage(named: selectedProduct?.productImageName ?? "")
        productNameLabel.text = selectedProduct?.productName
        productDescription.text = selectedProduct?.productDescription
        if let price = selectedProduct?.productPrice {
            productPriceLabel.text = String(price)
        }
    }

}
