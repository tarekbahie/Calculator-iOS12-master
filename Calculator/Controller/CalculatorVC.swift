//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber : Bool = true
    
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
//                fatalError("Can't convert display text to double !")
                return 0
            }
            return number
        } set {
            if String(newValue) == "inf" || String(newValue) == "nan"{
                displayLabel.fadeTransition(0.05)
                displayLabel.text = "Not a number"
            } else {
                displayLabel.fadeTransition(0.05)
            displayLabel.text = String(newValue)
        }
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle{
            
            if let result = calculator.Calculate(symbol: calcMethod) {
                displayValue = result
            }
            
        }
        
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        if var numValue = sender.currentTitle {
            if isFinishedTypingNumber {
            displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                
                
                if numValue == "." {
                    if let dispVal = displayLabel.text {
                    if dispVal.contains("."){
                        return
                    } else {
                        numValue = "."
                    }
                }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }

}

