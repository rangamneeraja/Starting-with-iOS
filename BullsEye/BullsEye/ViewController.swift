//
//  ViewController.swift
//  BullsEye
//
//  Created by neerajar on 27/01/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NumberLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var exactModeSwitch: UISwitch!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var counter = 0
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNumber = Int(arc4random_uniform(101))
        NumberLabel.text = "Move the Slider to:\(randomNumber)"
    }

    
    @IBAction func number_change_slider(_ sender: Any) {
        print(round(numberSlider.value))
        //NumberLabel.text = "\(round(numberSlider.value))"
    }
    
    @IBAction func result(_ sender: Any) {
        
        if exactModeSwitch.isOn == false {
            if (randomNumber >= Int(round(numberSlider.value))-3 && randomNumber <= Int(round(numberSlider.value))+3 ){
                resultLabel.text = "Yes you are right, it's a BullsEye !!!"
                resultLabel.backgroundColor = UIColor.green
            }
            else{
                resultLabel.text = "You are not right, try again"
                resultLabel.backgroundColor = UIColor.red
            }
        }
        else{
            if randomNumber == Int(round(numberSlider.value)){
                resultLabel.text = "Yes you are right, it's a BullsEye !!!"
                resultLabel.backgroundColor = UIColor.green
            }
            else{
                resultLabel.text = "You are not right, try again"
                resultLabel.backgroundColor = UIColor.red
            }
        }
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
        
    }
    
    @IBAction func playAgainClicked(_ sender: Any) {
        
        numberSlider.setValue(50, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        NumberLabel.text = "Move the Slider to:\(randomNumber)"
        resultLabel.isHidden = true
        playAgainButton.isHidden=true
    }
    
}

