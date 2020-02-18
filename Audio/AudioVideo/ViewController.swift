//
//  ViewController.swift
//  AudioVideo
//
//  Created by neeraja on 13/02/20.
//  Copyright © 2020 neeraja. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBOutlet weak var volumeControllerSlider: UISlider!
    
    @IBAction func changeTheVolume(_ sender: AnyObject) {
        audioPlayer.volume = volumeControllerSlider.value
    }
    
    @IBAction func pauseAudio(_ sender: AnyObject) {
        audioPlayer.pause()
    }
    
    @IBAction func playAudio(_ sender: AnyObject) {
        audioPlayer.play()
    }
    
    @IBAction func stopAudio(_ sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //sound file
        let sound = Bundle.main.path(forResource: "drum01", ofType: "mp3")
        do{
            //we try to get the initialize it with the URL we created above
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            
        }catch{
            //it will print any error.
            print(error)
        }
        
        //the following blocked code plays the music as soon as the app is opened
        /*let sound = Bundle.main.path(forResource: "drum01", ofType: "mp3")
        if let sound = sound
        {
            let myFilePathURL = NSURL(fileURLWithPath: sound)
            do{
                try  audioPlayer = AVAudioPlayer(contentsOf: myFilePathURL as URL)
                audioPlayer.play()
            }
            catch{
                print("Error")
            }
        }*/
    }
    
}

