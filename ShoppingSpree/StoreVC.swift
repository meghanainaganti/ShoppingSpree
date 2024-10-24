
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
    @IBOutlet weak var storeNameLabel: UILabel!
    
    @IBOutlet weak var storeTypeImage: UIImageView!
    @IBOutlet weak var storeTypeLabel: UILabel!
    @IBOutlet weak var storeNumberLabel: UILabel!
    @IBOutlet weak var storeLocationLabel: UILabel!
    @IBOutlet weak var storeWebsiteLabel: UILabel!
    
    var thisStore: StoreModel!
    
    weak var delegate: UIViewController! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        storeNameLabel.text = thisStore.name
        hoursLabel.text = thisStore.hours
//            storeImageItem.image = storeImage
        storeTypeLabel.text = thisStore.storetype
        storeNumberLabel.text = thisStore.phonenumber
        storeLocationLabel.text = thisStore.location
        storeWebsiteLabel.text = thisStore.website
        
//        if let imageUrl = URL(string: thisStore.image!) {
//            downloadImage(from: imageUrl) { imageS in
//                    DispatchQueue.main.async {
//                        self?.storeImageItem.image = imageS
//                }
//            }
//        }
//        
        if let imageUrlString = thisStore.image,
                   let imageUrl = URL(string: imageUrlString) {
                    downloadImage(from: imageUrl) { [weak self] image in
                        DispatchQueue.main.async {
                            self?.storeImageItem.image = image // Set the image to the UIImageView
                        }
                    }
        }
            
            //    if (storeType == "Store") {                     imageForStores.isHidden = false
            //          imageForRestaurants.isHidden = true
            //    } else if (storeType == "Restaurant")
            //          imageForRestaurants.isHidden = false
            //          imageForStores.isHidden = true
        // }
        }
    
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
              URLSession.shared.dataTask(with: url) { data, response, error in
                  if let data = data, let image = UIImage(data: data) {
                      completion(image)
                  } else {
                      completion(nil) // Handle failure
                  }
              }.resume()
          }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
