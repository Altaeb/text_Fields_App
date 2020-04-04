//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITextFieldDelegate

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var textField5: UITextField!
    @IBOutlet weak var textField6: UITextField!
    @IBOutlet weak var editingSwitch: UISwitch!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    // MARK: Text Field Delegate objects
    let emojiDelegate = EmojiTextFieldDelegate()
    let colorizerDelegate = ColorizerTextFieldDelegate()
    let randomColorTextFieldDelegate = RandomColorTextFieldDelegate()
    let cashTextFieldDelegate = CashTextFieldDelegate()
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.isHidden = true
        
        // Set the three delegates
        self.textField1.delegate = emojiDelegate
        self.textField2.delegate = colorizerDelegate
        self.textField3.delegate = self
        self.textField4.delegate = zipCodeTextFieldDelegate
        self.textField5.delegate = cashTextFieldDelegate
        self.textField6.delegate = randomColorTextFieldDelegate
        
        self.editingSwitch.setOn(false, animated: false)
    }
    
    // MARK: Text Field Delegate

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.editingSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
           
        return true;
    }
    
    // MARK: Actions
       
    @IBAction func toggleTheTextEditor(_ sender: AnyObject) {
           
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
    }
    
    // MARK: Text Field Delegate Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Figure out what the new text will be, if we return true
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        // hide the label if the newText will be an empty string
        self.characterCountLabel.isHidden = (newText.length == 0)
        
        // Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true;
    }
}

