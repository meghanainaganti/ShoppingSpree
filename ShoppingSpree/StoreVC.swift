//
//  StoreVC.swift
//  ShoppingSpree
//
//  Created by Alyssa Eldridge on 10/23/24.
//

import UIKit

class StoreVC: UIViewController {
    
    @IBOutlet weak var storeImageItem: UIImageView!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var storeNameLabel: UILabel! {
        didSet {
            if storeNameLabel == nil {
                print("label set to nil!")
            }
        }
    }
    
    @IBOutlet weak var storeTypeImage: UIImageView!
    @IBOutlet weak var storeTypeLabel: UILabel!
    @IBOutlet weak var storeNumberLabel: UILabel!
    @IBOutlet weak var storeLocationLabel: UILabel!
    @IBOutlet weak var storeWebsiteLabel: UILabel!
    
    var thisStore: StoreModel!
    
    var storeImage: UIImage!
    var storeName: String!
    var storeHours: String!
    var storeType: String!
    var storeNumber: String!
    var storeLocation: String!
    var storeWebsite: String!
    weak var delegate: UIViewController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        storeNameLabel.text = storeName
        print("view did load: \(storeName)")
        if let text = storeName {
            // storeNameLabel.text = text
            //            hoursLabel.text = storeHours
            //            storeImageItem.image = storeImage
            //            storeTypeLabel.text = storeType
            //            storeNumberLabel.text = storeNumber
            //            storeLocationLabel.text = storeLocation
            //            storeWebsiteLabel.text = storeWebsite
            
            
            //    if (storeType == "Store") {                     imageForStores.isHidden = false
            //          imageForRestaurants.isHidden = true
            //    } else if (storeType == "Restaurant")
            //          imageForRestaurants.isHidden = false
            //          imageForStores.isHidden = true
        // }
        }
        print("view did load on store vc")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
