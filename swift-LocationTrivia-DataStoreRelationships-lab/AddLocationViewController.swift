//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Raquel Rahmey on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

import UIKit

class AddLocationViewController : UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    let store = LocationDataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.accessibilityLabel = "nameField"
        nameField.accessibilityIdentifier = "nameField"
        latitudeField.accessibilityLabel = "latitudeField"
        latitudeField.accessibilityIdentifier = "latitudeField"
        longitudeField.accessibilityLabel = "longitudeField"
        longitudeField.accessibilityIdentifier = "longitudeField"
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func saveButton(_ sender: Any) {
        if nameField.text?.isEmpty != true && longitudeField.text?.isEmpty != true && latitudeField.text?.isEmpty != true {
            let newLocation = Location(name: nameField.text!, latitude: Float(latitudeField.text!)!, longitude: Float(longitudeField.text!)!)
                store.locations.append(newLocation)
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    
}
