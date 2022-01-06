//
//  CategorydaoModel.swift
//  SushiMarketingApp
//
//  Created by Serkan on 5.01.2022.
//

import Foundation



class Categorydao {
    
    let db:FMDatabase?
    
    init() {
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let databaseURL = URL(fileURLWithPath: targetWay).appendingPathComponent("sushidatabase.sqlite")
        
        db = FMDatabase(path: databaseURL.path)
    }
    
    func fetchCategory() -> [Category] {
        var list = [Category]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM category", values: nil)
            
            while rs.next() {
                let category = Category(categoryId: Int(rs.string(forColumn: "category_id"))!, categoryName: rs.string(forColumn: "category_name")!, categoryImageName: rs.string(forColumn: "category_imageName")!)
                
                list.append(category)
            }
        } catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        return list
    }
}
