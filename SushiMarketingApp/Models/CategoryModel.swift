//
//  CategoryModel.swift
//  SushiMarketingApp
//
//  Created by Serkan on 5.01.2022.
//

import Foundation



class Category {
    
    var categoryId:Int?
    var categoryName:String?
    var categoryImageName:String?
    
    
    init(){
        
    }
    
    init(categoryId:Int,categoryName:String,categoryImageName:String){
        self.categoryId = categoryId
        self.categoryName = categoryName
        self.categoryImageName = categoryImageName
    }
    
}
