//
//  DetailViewController.swift
//  wkwebview
//
//  Created by Sarvesh Patwardhan on 28/02/20.
//  Copyright © 2020 friends. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    let sampleURL = "https://developer.apple.com/documentation/webkit/wkwebview/"
      override func viewDidLoad() {
        super.viewDidLoad()
        
        sendRequest(urlString: sampleURL)
      }
      
      // Convert String into URL and load the URL
      private func sendRequest(urlString: String) {
        let myURL = URL(string: urlString)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
      }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

