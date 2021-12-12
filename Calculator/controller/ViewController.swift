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
    
    private lazy var calculateLogic = {
        return CalculatorLogic()
    }()
    
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
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishingType = true
                
        if let calcMethod = sender.currentTitle, let currentDisplayValue = Double(displayLabel.text!) {
            let result = calculateLogic.calculate(symbol: calcMethod, value: currentDisplayValue)
            displayLabel.text = "\(result)"
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



