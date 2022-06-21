//
//  SettingsViewController.swift
//  RandomNumderApp
//
//  Created by Nikolai Maksimov on 21.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var minimumNumberTextField: UITextField!
    @IBOutlet var maximumNumberTextField: UITextField!
    
    var randomNumber: RandomNumber!
    var delegate: SettingsViewControllerDelegate!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minimumNumberTextField.delegate = self
        maximumNumberTextField.delegate = self
       
        minimumNumberTextField.text = String(randomNumber.minimumValue)
        maximumNumberTextField.text = String(randomNumber.maximumValue)
    }
    
    @IBAction func saveNumbersButtonPressed() {
        view.endEditing(true)
        delegate.setNewValue(for: randomNumber)
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Int(newValue) else { return }
        
        if textField == minimumNumberTextField {
            randomNumber.minimumValue = numberValue
        } else {
            randomNumber.maximumValue = numberValue
        }
    }
}
