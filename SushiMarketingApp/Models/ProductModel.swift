//
//  ProductModel.swift
//  SushiMarketingApp
//
//  Created by Serkan on 5.01.2022.
//

import Foundation




class Product {
    var productId:Int?
    var productName:String?
    var productImageName:String?
    var productPrice:Double?
    var productDescription:String?
    var category:Category?
    
    init(){
        
    }
    
    init(productId:Int,productName:String,productImageName:String,productPrice:Double,productDescription:String,category:Category){
        self.productId = productId
        self.productName = productName
        self.productImageName = productImageName
        self.productPrice = productPrice
        self.productDescription = productDescription
        self.category = category
        
    }
}


