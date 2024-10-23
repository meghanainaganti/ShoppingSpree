//
//  BookmarkedStoresViewController.swift
//  ShoppingSpree
//
//  Created by Nidhi Venigalla on 10/21/24.
//

import UIKit

struct Store {
    let name: String
    let imageName: String
}

class BookmarkedStoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var bookmarkedStores: [Store] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        loadBookmarkedStores()
    }

    func loadBookmarkedStores() {
        bookmarkedStores = [
            Store(name: "Auntie Anne's", imageName: "auntie_annes"),
            Store(name: "Bath & Body Works", imageName: "bath_body_works")
        ]
        tableView.reloadData()
    }

    // MARK: - UITableView DataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarkedStores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath)

        let store = bookmarkedStores[indexPath.row]

        cell.textLabel?.text = store.name



        return cell
    }

    // MARK: - UITableView Delegate Methods (Optional)

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStore = bookmarkedStores[indexPath.row]
        print("Selected store: \(selectedStore.name)")
    }
}
