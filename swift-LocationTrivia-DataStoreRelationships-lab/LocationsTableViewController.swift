//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Raquel Rahmey on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class LocationsTableViewController: UITableViewController {
    
    let store: LocationDataStore = LocationDataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityLabel = "Locations Table"
        tableView.accessibilityIdentifier = "Locations Table"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "right detail", for: indexPath)
        let location = store.locations[indexPath.row]
        cell.textLabel?.text = "\(location.name)"
        cell.detailTextLabel?.text = "\(location.trivia.count)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "triviaSegue" {
        if let destination = segue.destination as? TriviaTableViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            destination.location = store.locations[indexPath.row]
        }
        }
        else if segue.identifier == "locationAdd" {
            if let destination = segue.destination as? AddLocationViewController {
                
            }
        }
        
    }
}
