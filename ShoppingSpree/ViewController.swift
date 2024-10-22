//
//  ViewController.swift
//  ShoppingSpree
//
//  Created by Meghana Inaganti on 10/16/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func bookmarkButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToBookmarkedStores", sender: self)
    }
    
    @IBAction func bookmarkTapped(_ sender: UITapGestureRecognizer) {
        // Trigger the segue to go to BookmarkedStoresViewController
        performSegue(withIdentifier: "goToBookmarkedStores", sender: self)
    }




}

