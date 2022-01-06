import Foundation

class Campaign {
    var campaignId:Int?
    var campaignName:String?
    var campaignImageName:String?
    
    init(){
        
    }
    init(campaignId:Int,campaignName:String,campaignImageName:String){
        self.campaignId = campaignId
        self.campaignName = campaignName
        self.campaignImageName = campaignImageName
        
    }
}

let CampaignArray1 = Campaign(campaignId: 1, campaignName: "Ocak ayı indirimleri  ", campaignImageName: "kampanya6")
let CampaignArray2 = Campaign(campaignId: 2, campaignName: "California Roll siparişinize indirimler", campaignImageName: "kampanya5")
let CampaignArray3 = Campaign(campaignId: 3, campaignName: "Size özel indirimler  ", campaignImageName: "kampanya4")
let CampaignArray4 = Campaign(campaignId: 4, campaignName: "Sizde sushi dünyasını keşfedin", campaignImageName: "kampanya3")
let CampaignArray5 = Campaign(campaignId: 5, campaignName: "Aile boyu indirimler  ", campaignImageName: "kampanya2")
let CampaignArray6 = Campaign(campaignId: 6, campaignName: "Sushi app indirimleri", campaignImageName: "kampanya1")
