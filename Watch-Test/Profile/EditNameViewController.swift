//
//  EditNameViewController.swift
//  MC2 User Profile
//
//  Created by Thomas Pratama Putra on 12/07/19.
//  Copyright © 2019 thomaspputra. All rights reserved.
//

import UIKit

class EditNameViewController: UIViewController {
    @IBOutlet weak var editFullNameTextField: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        setupView()
        editFullNameTextField.text = defaults.string(forKey: Key.userFullName)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        editFullNameTextField.becomeFirstResponder()
    }
    
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.2117647059, alpha: 1)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        defaults.set(editFullNameTextField.text, forKey: Key.userFullName)
        editFullNameTextField.resignFirstResponder()
        navigationController?.popViewController(animated: true)
    }
}
