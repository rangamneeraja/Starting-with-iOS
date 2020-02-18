//
//  ViewController.swift
//  Calculator
//
//  Created by neerajar on 29/01/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var currentOperation: Operator = Operator.nothing
    var calculation_State: CalculationState = CalculationState.enteringNum
    
    var firstValue: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func numberIsClicked(_ sender: UIButton) {
        //calling a func to update display as clicked on numbers
        updateDisplay (number: String(sender.tag))
    }
    //function to concatinate numbers numbers entered
    func updateDisplay (number: String) {
        
        if calculation_State == CalculationState.newNumStarted {
            if let num = resultLabel.text {
                if num != "" {
                    firstValue = num
                }
            }
            calculation_State = CalculationState.enteringNum
            resultLabel.text = number
        }
        else if calculation_State == CalculationState.enteringNum{
            resultLabel.text = resultLabel.text! + number
            //concatination
            //"grant" +"k" = "grant k"
        }
    }
    
    @IBAction func operatorIsClicked(_ sender: UIButton) {
        
        calculation_State = CalculationState.newNumStarted
        
        if let num = resultLabel.text {
            if num != "" {
                firstValue = num
                resultLabel.text = ""
            }
        }
        updateOperatorButton(tag: sender.tag)
        
        switch sender.tag {
            case 11:
                currentOperation = Operator.add
                print("add")
            case 12:
                currentOperation = Operator.subtract
                print("minus")
            case 13:
                 currentOperation = Operator.times
                print("times")
            case 14:
                 currentOperation = Operator.divide
                print("divide")
            default:
                return
        }
    }
    
    @IBAction func clickOnEqual(_ sender: UIButton) {
        
        calculateSum()
    }
    
    func calculateSum() {
        
        if (firstValue.isEmpty) {
            return
        }
        
        var result = ""
        if currentOperation == Operator.times {
            result = "\(Double(firstValue)! * Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.divide {
            result = "\(Double(firstValue)! / Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.add {
            result = "\(Double(firstValue)! + Double(resultLabel.text!)!)"
        }
        else if currentOperation == Operator.subtract {
            result = "\(Double(firstValue)! - Double(resultLabel.text!)!)"
        }
        
        resultLabel.text = result
        calculation_State = CalculationState.newNumStarted
    }
    
    func updateOperatorButton (tag: Int){
        //clear colors
        for var i in 10..<15{
            if let button = self.view.viewWithTag(i) as? UIButton {
                button.backgroundColor = UIColor.clear
            }
        }
        //change color button
        if let button = self.view.viewWithTag(tag) as? UIButton {
            button.backgroundColor = UIColor.yellow
        }
    }
}

