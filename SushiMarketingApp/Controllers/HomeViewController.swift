//
//  ViewController.swift
//  SushiMarketingApp
//
//  Created by Serkan on 5.01.2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var sliderPageView: UIPageControl!
    @IBOutlet weak var categoryTableView: UITableView!
    
    var slider = [Slider]()
    
    var categoryList = [Category]()
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Serkan")
        databaseCopy()
        
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        categoryTableView.dataSource = self
        categoryTableView.delegate = self
        
        categoryList = Categorydao().fetchCategory()
        
        sliderPageView.numberOfPages = slider.count
        sliderPageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        slider.append(slider1)
        slider.append(slider2)
        slider.append(slider3)
    }
    
    
    func databaseCopy(){
        
        let bundleWay = Bundle.main.path(forResource: "sushidatabase", ofType: ".sqlite")
        
        let targetWay = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let copyAround = URL(fileURLWithPath: targetWay).appendingPathComponent("sushidatabase.sqlite")
        
        if fileManager.fileExists(atPath: copyAround.path){
            print("Veri tabanı zaten kopyalanmış")
        }else{
            do {
                try fileManager.copyItem(atPath: bundleWay!, toPath: copyAround.path)
            }catch{
                print(error)
            }
        }
    }
    
    @objc func changeImage() {
        if counter < slider.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter+=1
            sliderPageView.currentPage = counter
        }else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            sliderPageView.currentPage = counter
        }
    }
}




extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return slider.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sliders = slider[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! SliderCollectionViewCell
        
        cell.sliderImageView.image = UIImage(named: sliders.imageName!)
        cell.sliderImageView.layer.cornerRadius = 20.0
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        sliderPageView.currentPage = indexPath.row
    }
}


extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categorys = categoryList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryTableViewCell
        
        cell.categoryLabel.text = categorys.categoryName
        cell.categoryImageView.image = UIImage(named: categorys.categoryImageName!)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        self.performSegue(withIdentifier: "toCategoryDetail", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        
        let destinationVC = segue.destination as! CategoryDetailVC
        destinationVC.category = categoryList[index!]
    }
    
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}

