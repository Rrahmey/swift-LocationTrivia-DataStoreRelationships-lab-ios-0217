//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Raquel Rahmey on 3/6/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

import UIKit

class AddTriviaViewController: UIViewController {
    
    @IBOutlet weak var triviumTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!

    
    var store = LocationDataStore.sharedInstance
    var newTriviaLocation : Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        triviumTextField.accessibilityLabel = "Trivium Text Field"
        triviumTextField.accessibilityIdentifier = "Trivium Text Field"
        cancelButton.accessibilityIdentifier = "Cancel Button"
        cancelButton.accessibilityLabel = "Cancel Button"

    }
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButton(_ sender: Any) {
        if triviumTextField.text?.isEmpty != true {
            let trivia = Trivium(content: triviumTextField.text!, likes: 0)
            newTriviaLocation.trivia.append(trivia)

            print(newTriviaLocation.trivia.count)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
}
