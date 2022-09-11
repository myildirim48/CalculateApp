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
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinisTypingNumber = true
        
        if let calcMethod = sender.currentTitle{
            if calcMethod == "+"{
                displayValue *= -1
            }else if calcMethod == "AC"{
                displayLabel.text = "0"
            }else if calcMethod == "%"{
                displayValue *= 0.01
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

