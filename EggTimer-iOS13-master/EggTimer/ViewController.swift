//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft":5*60, "Medium":7*60, "Hard":12*60]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countdownTimer: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer = Timer()
    var secondsPassed = 0
    var totalTime = 0
    
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        
        titleLabel.text = hardness
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            let progressPercent = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = progressPercent
        } else {
            timer.invalidate()
            titleLabel.text = "DONE !!"
            playsound()
        }
    }
    func playsound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
}
