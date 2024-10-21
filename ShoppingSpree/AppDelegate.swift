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
//        addStores()
        fetchAndPrintStores()
//          clearStoreList()
        return true
    }
    
    func addStores() {
        let context = persistentContainer.viewContext
        let store1 = StoreModel(context: context)
            store1.name = "Abercrombie & Fitch"
            store1.storetype = "Clothing"
            store1.location = "Lower Level Dillard's Wing next to Shoe Palace"
            store1.hours = "Monday to Thursday 11AM - 8PM \nFriday to Saturday 10AM - 9PM \nSunday 12PM - 6PM"
            store1.phonenumber = "(512) 329-8323"
            store1.image = "https://cdn-fsly.yottaa.net/555a305b2bb0ac71b9002d22/4a6e24e07e33013b5e040ead9ecbf798.yottaa.net/v~4b.32f.0.0/tenantlogos/94.png?yocs=D_NA_"
        do {
            try context.save()
        } catch {
            print("Failed to add stores: \(error)")
        }
        
    }
    
    func fetchAndPrintStores() {
        // Get the Core Data context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        // Create a fetch request for the Store entity
        let fetchRequest: NSFetchRequest<StoreModel> = StoreModel.fetchRequest()

        do {
            // Perform the fetch request
            let stores = try context.fetch(fetchRequest)
            
            // Check if there are any stores
            if stores.isEmpty {
                print("No stores found.")
            } else {
                // Loop through the fetched stores and print their properties
                for store in stores {
                    print("Store Name: \(store.name ?? "No Name")")
                    print("Category: \(store.storetype ?? "No Type")")
                    print("Description: \(store.phonenumber ?? "No phonenumber")")
                    print("Location: \(store.location ?? "No Location")")
                    print("Hours: \(store.hours ?? "No Hours")")
                    print("Image: \(store.image ?? "No image")")
                    print("----------------------------------")
                }
            }
        } catch {
            print("Failed to fetch stores: \(error)")
        }
    }
    
    func clearStoreList() {
        // Get the Core Data context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        // Create a fetch request for the Store entity
        let fetchRequest: NSFetchRequest<StoreModel> = StoreModel.fetchRequest()

        do {
            // Perform the fetch request
            let stores = try context.fetch(fetchRequest)

            // Loop through and delete each store
            for store in stores {
                context.delete(store)
            }

            // Save the context to persist the changes
            try context.save()
            print("All stores deleted successfully!")
        } catch {
            print("Failed to delete stores: \(error)")
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

