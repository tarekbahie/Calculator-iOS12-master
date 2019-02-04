//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by tarek bahie on 2/2/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
struct CalculatorLogic {
    
    private var number : Double?
    private var intermediateCalculation : (number : Double ,operation : String)?
    
    
    mutating func setNumber(_ number : Double) {
        self.number = number
    }
    
    mutating func Calculate (symbol : String)-> Double? {
        if let n = number {
            switch symbol {
            case "AC":  intermediateCalculation?.operation = ""
                        return 0.0
            case "+/-": return (n * -1)
            case "%":   return (n / 100)
            case "=":   return performTwoNumCalculation(n2 : n)
            default :   intermediateCalculation = (number : n, operation : symbol)
            }
        }
        return nil
    
    }
    
    private func performTwoNumCalculation(n2 : Double)-> Double? {
        if let n1 = intermediateCalculation?.number, let oper = intermediateCalculation?.operation {
            switch oper {
            case "+" : return n1 + n2
            case "-" : return n1 - n2
            case "÷" : return n1 / n2
            case "×" : return n1 * n2
            default : break
            }
            
        }
        return nil
    }
}
