//
//  WebViewController.swift
//  Slide Browser
//
//  Created by Chris Wong on 2017-03-04.
//  Copyright © 2017 Chris Wong. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    var url: String?
    var backButtonTapped = false
    
    //sets inital URL
    var initialURL: String = "http://www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initializes the slide menu
        if self.revealViewController() != nil {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // sets the inital URL of the web view to google

        if let unWrapURL = url {
            var URL = NSURL(string: "http://" + unWrapURL)
            webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
        } else {
            var URL = NSURL(string: initialURL)
            webView.loadRequest(NSURLRequest(url: URL! as URL) as URLRequest)
            print(URL)
        }
        
        if backButtonTapped == true && webView.canGoBack == true{
            webView.goBack()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
