import UIKit

// Model to represent a Store
struct Store {
    let name: String
    let imageName: String
}

class BookmarkedStoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!  // Outlet for the table view

    var bookmarkedStores: [Store] = []  // Array to hold the bookmarked stores

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set delegate and data source for the table view
        tableView.delegate = self
        tableView.dataSource = self

        // Load your stores here (from Firebase or local storage)
        loadBookmarkedStores()
    }

    // Load sample data into the bookmarked stores array
    func loadBookmarkedStores() {
        // Populate with sample data
        bookmarkedStores = [
            Store(name: "Auntie Anne's", imageName: "auntie_annes"),
            Store(name: "Bath & Body Works", imageName: "bath_body_works")
        ]
        // Reload the table view to display the stores
        tableView.reloadData()
    }

    // MARK: - UITableView DataSource Methods

    // Number of rows in the table view (based on the number of bookmarked stores)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarkedStores.count
    }

    // Configure the table view cells to display the store names and images
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell with the identifier "BookmarkCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkCell", for: indexPath)

        // Get the store for the current row
        let store = bookmarkedStores[indexPath.row]

        // Set the store's name as the text label of the cell
        cell.textLabel?.text = store.name

        // Optionally set an image if available (make sure the image is in Assets.xcassets)
        // cell.imageView?.image = UIImage(named: store.imageName)

        return cell
    }

    // MARK: - UITableView Delegate Methods (Optional)

    // This method handles what happens when a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStore = bookmarkedStores[indexPath.row]
        print("Selected store: \(selectedStore.name)")
        // You can navigate to a store details page or perform other actions here
    }
}
