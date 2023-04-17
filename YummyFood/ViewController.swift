//
//  ViewController.swift
//  YummyFood
//
//  Created by Tilak Basnet on 3/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    var searchQuery = ""
    
    @IBOutlet weak var searchInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.searchInput.resignFirstResponder()
        if segue.identifier == "recipesData" {
            let recipeTVC: RecipeTVC = segue.destination as! RecipeTVC
            recipeTVC.searchQuery = self.searchQuery
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.resignFirstResponder()
        if textField == self.searchInput {
            self.searchQuery = textField.text!
        }
    }
}
