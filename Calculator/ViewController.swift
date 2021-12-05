//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishingType = true
    
    private var singleCommands: [String: (Double) -> Double] = [:]
    
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert displayLabel text to Double.")
            }
            
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        singleCommands["+/-"] = { value in
            return value * -1
        }
        
        singleCommands["AC"] = { value in
            return 0
        }
        
        singleCommands["%"] = { value in
            return value * 0.01
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishingType = true
                
        if let calcMethod = sender.currentTitle {
            
            if let safeAction = singleCommands[calcMethod] {
                displayValue = safeAction(displayValue)
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let value = sender.currentTitle {
            
            if isFinishingType {
                displayLabel.text = value
                isFinishingType = false
            } else {
                
                    if value == "." {
                    
                        if displayLabel.text?.contains(".") == true {
                            return
                        }
                            
                        guard let currentDisplayValue = Double(displayLabel.text!) else {
                            fatalError("Cannot convert displayLabel text to Double.")
                        }
                        
                        if (!(floor(currentDisplayValue) == currentDisplayValue)) {
                            return
                        }
                }
                
                displayLabel.text = (displayLabel.text ?? "") + value
            }
        }
            
    }
}



