//
//  SecondViewController.swift
//  TeamLease
//
//  Created by Mahadev on 29/06/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblSuit: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblStreet: UILabel!
    @IBOutlet weak var lblZipcode: UILabel!
    
    @IBOutlet weak var lblComName: UILabel!
    @IBOutlet weak var lblPharase: UILabel!
    @IBOutlet weak var lblBs: UILabel!

    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    
    @IBOutlet weak var imgFav: UIImageView!
    
   static var delegate : passfav? = nil
    var detailData : model_emp!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Employee Details"
        
        lblName.text = detailData?.name
        lblUserName.text = detailData?.username
        
        lblSuit.text = detailData?.address?.suite
        lblCity.text = detailData?.address?.city
        lblStreet.text = detailData?.address?.street
        lblZipcode.text = detailData?.address?.zipcode
        
        lblComName.text = detailData?.company?.name
        lblPharase.text = detailData?.company?.catchPhrase
        lblBs.text = detailData?.company?.bs
        
        lblWebsite.text = detailData?.website
        lblPhone.text = detailData?.phone
        
        
    
    }
    override func viewWillAppear(_ animated: Bool) {
    if detailData.fav {
        imgFav.image = UIImage(named: "fav_active")
    }
    else{
        imgFav.image = UIImage(named: "fav")
    }
    }
    
    @IBAction func btnFavAction(_ sender: Any) {
        if detailData.fav {
            imgFav.image = UIImage(named: "fav")
            imgFav.tag = 0
        }
        else {
            imgFav.image = UIImage(named: "fav_active")
            imgFav.tag = 1
        }
        SecondViewController.delegate?.action2("fav", data: detailData)
    }
    
}
