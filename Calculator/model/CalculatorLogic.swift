//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Thiago Antonio Ramalho on 05/12/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    private var singleCommands: [String: (Double) -> Double?] = [:]
    private var steps: [String: Double] = [:]
    
    init() {
        singleCommands["+/-"] = { value in
            return value * -1
        }
        
        singleCommands["AC"] = { value in
            self.steps = [:]
            return 0
        }
        
        singleCommands["%"] = { value in
            return value * 0.01
        }
        singleCommands["+"] = { value in
            self.steps["+"] = value
            return nil
        }
        singleCommands["-"] = { value in
            self.steps["-"] = value
            return nil
        }
        singleCommands["x"] = { value in
            self.steps["x"] = value
            return nil
        }
        singleCommands["%"] = { value in
            self.steps["%"] = value
            return nil
        }
        singleCommands["="] = { value in
            self.steps["="] = value
            return self.execute()
        }
    }
    
    func calculate(symbol: String, value: Double) -> Double? {
        
        if let safeAction = singleCommands[symbol] {
            return safeAction(value)
        }

        return nil
    }
    
    private func execute() -> Double {
        
        var result: Double = 0
        
        steps.forEach { (key: String, value: Double) in
            
        }
        
        return result
    }
}
