//
//  SecondViewController.swift
//  Back to the Future
//
//  Created by neerajar on 30/01/20.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label14: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonIsClicked(_ sender: AnyObject) {
        let utils = Utilities()
        let year = utils.getRandomYear()
        label11.text = utils.getLetterAtIndex(str: year, location: 0)
        label12.text = utils.getLetterAtIndex(str: year, location: 1)
        label13.text = utils.getLetterAtIndex(str: year, location: 2)
        label14.text = utils.getLetterAtIndex(str: year, location: 3)
        
        animateItem(duration: 0.5, delay: 0, object: label11)
        animateItem(duration: 0.5, delay: 0.2, object: label12)
        animateItem(duration: 0.5, delay: 0.3, object: label13)
        animateItem(duration: 0.5, delay: 0.4, object: label14)
        
        /*********animation example
         UIView.animate(withDuration: 0.5) {
            self.label11.center.y += self.view.bounds.width
        }*/
        
    }
    func animateItem (duration: Double, delay: Double, object: UIView) {
        
        UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
            object.center.y += self.view.bounds.width
            //for animation for x axis
            // object.center.x += self.view.bounds.width
        }) { (true) in
            
        }
    }
    
}

