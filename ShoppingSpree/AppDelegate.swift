//
//  AppDelegate.swift
//  ShoppingSpree
//
//  Created by Meghana Inaganti on 10/16/24.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        clearAllStores()
        importCSVDataToCoreData()
         fetchAndPrintStores()
        return true
    }

    func readCSV(fileName: String) -> [[String]]? {
        if let filePath = Bundle.main.path(forResource: fileName, ofType: "csv") {
            do {
                let content = try String(contentsOfFile: filePath)
                let lines = content.components(separatedBy: "\n")
                
                // Process each line and replace "***" with newline character
                let csvData = lines.map { line in
                    line.components(separatedBy: ",").map { field in
                        field.replacingOccurrences(of: "***", with: "\n")
                    }
                }
                
                return csvData
            } catch {
                print("Error reading CSV file: \(error)")
            }
        } else {
            print("File not found")
        }
        return nil
    }
    
    func importCSVDataToCoreData() {
        if let csvData = readCSV(fileName: "malldata") {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            for row in csvData.dropFirst() {
                if row.count == 8 {
                    let store = StoreModel(context: context)
                    store.name = row[0]
                    store.hours = row[1]
                    store.website = row[2]
                    store.storetype = row[3]
                    store.location = row[4]
                    store.phonenumber = row[5]
                    store.image = row[6]
                    store.mapurl = row[7]
                    
                }
            }
            
            print(csvData.count)
            
            do {
                try context.save()
                print("Stores imported successfully!")
            } catch {
                print("Failed to save stores to Core Data: \(error)")
            }
        } else {
            print("No data found in CSV")
        }
    }
    
    func fetchAndPrintStores() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<StoreModel> = StoreModel.fetchRequest()
        
        do {
            let stores = try context.fetch(fetchRequest)
            
            if stores.isEmpty {
                print("No stores found in Core Data.")
            } else {
                for store in stores {
                    print("Store Name: \(store.name ?? "Unknown")")
                    print("Hours: \(store.hours ?? "Unknown")")
                    print("Store Type: \(store.storetype ?? "No description available")")
                    print("Website: \(store.website ?? "Unknown")")
                    print("Location: \(store.location ?? "Unknown")")
                    print("Number: \(store.phonenumber ?? "No hours available")")
                    print("Img: \(store.image ?? "Unknown")")
                    print("-----------------------------")
                }
            }
        } catch {
            print("Failed to fetch stores: \(error)")
        }
    }
    
    func clearAllStores() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let fetchRequest: NSFetchRequest<StoreModel> = StoreModel.fetchRequest()
        
        do {
            let stores = try context.fetch(fetchRequest)
            
            for store in stores {
                context.delete(store)
            }
            
            try context.save()
            print("All stores deleted successfully.")
            
        } catch {
            print("Failed to delete stores: \(error.localizedDescription)")
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ShoppingSpree")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

