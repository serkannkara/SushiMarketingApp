//
//  CampaignDetailVC.swift
//  SushiMarketingApp
//
//  Created by Serkan on 5.01.2022.
//

import UIKit

class CampaignDetailVC: UIViewController {
    @IBOutlet weak var campaignDetailImageView: UIImageView!
    
    @IBOutlet weak var campaignDetailLabel: UILabel!
    
    
    var selectedCampaign: Campaign?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        campaignDetailImageView.image = UIImage(named: selectedCampaign?.campaignImageName! ?? "")
        campaignDetailLabel.text = selectedCampaign?.campaignName
    }
}
