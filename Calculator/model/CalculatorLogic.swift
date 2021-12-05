//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Thiago Antonio Ramalho on 05/12/21.
//  Copyright © 2021 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var singleCommands: [String: (Double) -> Double] = [:]
    
    init() {
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
    
    func calculate(symbol: String, value: Double) -> Double {
        
        if let safeAction = singleCommands[symbol] {
            return safeAction(value)
        }

        return Double(0)
    }
    
}
