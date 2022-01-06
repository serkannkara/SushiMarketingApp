//
//  CampaignViewController.swift
//  SushiMarketingApp
//
//  Created by Serkan on 5.01.2022.
//

import UIKit

class CampaignViewController: UIViewController {
    @IBOutlet weak var campaignCollectionView: UICollectionView!
    
    var campaign = [Campaign]()
    var chosenCampaign:Campaign?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        campaignCollectionView.delegate = self
        campaignCollectionView.dataSource = self
        
        
        campaign.append(CampaignArray1)
        campaign.append(CampaignArray2)
        campaign.append(CampaignArray3)
        campaign.append(CampaignArray4)
        campaign.append(CampaignArray5)
        campaign.append(CampaignArray6)
    }
    
}

extension CampaignViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return campaign.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let campaigns = campaign[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "campaignCell", for: indexPath) as! CampaignCollectionViewCell
        
        cell.campaignImageView.image = UIImage(named: campaigns.campaignImageName!)
        cell.campaignLabel.text = campaigns.campaignName
        
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 4
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.shadowColor = UIColor.systemGray6.cgColor
        cell.layer.shadowOffset = CGSize(width: 30.0, height: 30.0)
        cell.layer.shadowRadius = 30.0
        cell.layer.shadowOpacity = 20.0
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenCampaign = campaign[indexPath.row]
        
        self.performSegue(withIdentifier: "toCampaignDetailVC", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCampaignDetailVC" {
            let destinationVC = segue.destination as! CampaignDetailVC
            destinationVC.selectedCampaign = chosenCampaign
        }
    }
    
    
}
