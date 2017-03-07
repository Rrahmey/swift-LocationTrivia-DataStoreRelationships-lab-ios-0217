//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Raquel Rahmey on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

class TriviaTableViewController: UITableViewController {
    
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityIdentifier = "Trivia Table"
        tableView.accessibilityLabel = "Trivia Table"
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "add Trivia Button"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "add Trivia Button"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.trivia.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        let trivia = location.trivia[indexPath.row]
        cell.textLabel?.text = "\(trivia.content)"
        cell.detailTextLabel?.text = "\(trivia.likes)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "triviaAdd" {
            if let destination = segue.destination as? AddTriviaViewController {
                destination.newTriviaLocation = location 
                
            }
    }
    }
}
