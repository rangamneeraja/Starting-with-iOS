//
//  ViewController.swift
//  CallMessageEmail App
//
//  Created by neeraja on 14/02/20.
//  Copyright © 2020 neeraja. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func callMeButton(_ sender: UIButton) {
        let url:NSURL = URL(string: "TEL://+919177815224")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func messageMeButton(_ sender: UIButton) {
        
        if (MFMessageComposeViewController.canSendText()) { //Checking whether we can send the message.
            let controller = MFMessageComposeViewController()
            controller.body = ""
            controller.recipients = ["0410171700"]
            controller.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
            self.present(controller, animated: true, completion: nil)
        }
            //This is just for testing because we cannot send the message from simulator.
        else{
            print("Cannot send the message")
        }
        
        func messageComposeViewController(controller:
            MFMessageComposeViewController!, didFinishWithResult result: MessageComposeResult) {
            //Displaying the message screen with animation.
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func emailMeButton(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
            mail.setToRecipients(["neeraja.bhargavi@gmail.com"])
            mail.setMessageBody("<h1>Hello there, This is a test.<h1>", isHTML: true)
            present(mail, animated: true)
        } else {
            print("Cannot send email")
        }
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
    
}

