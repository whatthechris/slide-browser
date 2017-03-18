//
//  WKWebViewController.swift
//  Slide Browser
//
//  Created by Chris Wong on 2017-03-04.
//  Copyright © 2017 Chris Wong. All rights reserved.
//

import UIKit
import WebKit

var webViewScrolled: Bool = false

class View2: UIViewController, WKUIDelegate, WKNavigationDelegate, UIScrollViewDelegate{
    
    var webView: WKWebView!
    var progBar = UIProgressView()
    var pullRefreshBar = UIProgressView()
    
    var url: String?
    var backButtonTapped = false
    
    //sets inital URL
    var initialURL: String = "https://www.facebook.com"
    
    //Hides Status Bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //rotates the webview
        self.view.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        // Draws the progress bar, sets progress to 0
        progBar = UIProgressView(frame: CGRect(x: 50, y: self.view.frame.height/2, width: self.view.frame.width-100, height: 100))
        progBar.progress = 0.0
        progBar.tintColor = UIColor.blue
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.addSubview(progBar)
        
        // Draws the progress bar, sets progress to 0
        pullRefreshBar = UIProgressView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100))
        pullRefreshBar.progress = 0.0
        pullRefreshBar.tintColor = UIColor.red
        webView.addSubview(pullRefreshBar)
    }
    
    // Updates the progress bar when webView's estimatedProgress changes
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        progBar.progress = Float(webView.estimatedProgress)
        
        if progBar.progress >= 0.95 {
            progBar.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adds the webView into the view controller
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.scrollView.delegate = self
        view = webView
        
        if let unWrapURL = url {
            let myURL = URL(string: "http://" + unWrapURL)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        } else {
            let myURL = URL(string: initialURL)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
        
        if backButtonTapped == true && webView.canGoBack == true{
            webView.goBack()
        }
        
    }

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        webViewScrolled = true
        print(webViewScrolled)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y < 0){
            pullRefreshBar.progress = Float(scrollView.contentOffset.y*(-0.01))
        }
        if (scrollView.contentOffset.y < -100){
            pullRefreshBar.tintColor = UIColor.green
        } else {
            pullRefreshBar.tintColor = UIColor.red
        }
        //webView.scrollView.isScrollEnabled = false
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        webViewScrolled = false
        print(webViewScrolled)
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (scrollView.contentOffset.y < -100){
            webView.reload()
            pullRefreshBar.tintColor = UIColor.red
            pullRefreshBar.progress = 0.0
        }
        webViewScrolled = false
        print(webViewScrolled)
    }

    //removes the webView observer
    //deinit {
      //  webView!.removeObserver(self, forKeyPath: "estimatedProgress")
    //}
    
}
