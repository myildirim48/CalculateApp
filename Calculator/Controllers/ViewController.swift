//
//  ViewController.swift
//  Calculator
//

//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinisTypingNumber: Bool = true
    
    private var displayValue: Double{
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double..")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinisTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle{
            if let result = calculator.calculate(symbol: calcMethod){
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue =  sender.currentTitle{
            
            if isFinisTypingNumber{
                displayLabel.text = numValue
                isFinisTypingNumber = false
            }else{
                
                if numValue == "."{

                    let isIInt = floor(displayValue) == displayValue
                    
                    if !isIInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
    }
    
    
    
}

