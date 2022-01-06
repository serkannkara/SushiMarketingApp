//
//  ProductdaoModel.swift
//  SushiMarketingApp
//
//  Created by Serkan on 5.01.2022.
//

import Foundation



class Productdao {
    
    let db:FMDatabase?
    
    init() {
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let databaseURL = URL(fileURLWithPath: targetWay).appendingPathComponent("sushidatabase.sqlite")
        
        db = FMDatabase(path: databaseURL.path)
    }
    
    func fetchProduct(category_id:Int) -> [Product] {
        var list = [Product]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM category,product WHERE product.category_id = category.category_id and product.category_id = ?", values: [category_id])
            
            while rs.next() {
                let category = Category(categoryId: Int(rs.string(forColumn: "category_id"))!, categoryName: rs.string(forColumn: "category_name")!, categoryImageName: rs.string(forColumn: "category_imageName")!)
                
                let product = Product(productId: Int(rs.string(forColumn: "product_id"))!, productName: rs.string(forColumn: "product_name")!, productImageName: rs.string(forColumn: "product_imageName")!, productPrice: Double(rs.string(forColumn: "product_price"))!, productDescription: rs.string(forColumn: "product_description")!, category: category)
                
                list.append(product)
            }
        } catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        return list
    }
    
    
}
