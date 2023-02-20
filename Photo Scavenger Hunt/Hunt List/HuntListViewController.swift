//
//  HuntListViewController.swift
//  Photo Scavenger Hunt
//
//  Created by Kevin Velazco on 2/19/23.
//

import UIKit

class HuntListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var hunts = [Hunt]() {
        didSet {

            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // UI candy: Hide 1st / top cell separator
        tableView.tableHeaderView = UIView()

        tableView.dataSource = self

        hunts = Hunt.mockedHunts
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "DetailSegue" {
            if let detailViewController = segue.destination as? HuntDetailViewController,
                // Get the index path for the current selected table view row.
               let selectedIndexPath = tableView.indexPathForSelectedRow {

                // Get the task associated with the slected index path
                let hunt = hunts[selectedIndexPath.row]

                // Set the selected task on the detail view controller.
                detailViewController.hunt = hunt
            }
        }
    }
     

}

extension HuntListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hunts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HuntCell", for: indexPath) as? HuntCell else {
            fatalError("Unable to dequeue Hunt Cell")
        }

        cell.configure(with: hunts[indexPath.row])

        return cell
    }
}
