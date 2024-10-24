//
//  StoreDirectory.swift
//  ShoppingSpree
//
//  Created by Meghana Inaganti on 10/20/24.
//

import UIKit
import CoreData

class StoreDirectory: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var stores: [StoreModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let fetchRequest: NSFetchRequest<StoreModel> = StoreModel.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
           fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            stores = try context.fetch(fetchRequest)
        } catch {
            print("Error fetching store data")
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DirectoryCell", for: indexPath) as! DirectoryCell
        let row = indexPath.row
        let store = stores[row]
        cell.storeName?.text = store.name
        
        if let imageUrl = URL(string: store.image!) {
                downloadImage(from: imageUrl) { imageS in
                    DispatchQueue.main.async {
                        cell.storeImage.image = imageS
                    }
                }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            // Get the new view controller using segue.destination.
//            // Pass the selected object to the new view controller.
//            if segue.identifier == "selectStoreSegue",
//                let nextVC = segue.destination as? StoreVC,
//                let cell = sender as? UITableViewCell,
//                let indexPath = tableView.indexPath(for: cell) {
//                    let currentStore = stores[indexPath.row]
//                    nextVC.thisStore = currentStore
//                    nextVC.delegate = self
//            }
//        }


}
