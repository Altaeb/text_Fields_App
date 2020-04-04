//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Abdalfattah Altaeb on 4/4/20.
//  Copyright © 2020 Udacity. All rights reserved.
//

import Foundation

import UIKit

class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    // MARK: Array of colors
    let colors:[UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    // MARK: Choose a random number
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        return colors[randomIndex]
    }
    
    // MARK: Set textField to the random choosen color
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = randomColor()
        return true
    }
}
