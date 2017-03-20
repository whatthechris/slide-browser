//
//  MenuViewController.swift
//  Slide Browser
//
//  Created by Chris Wong on 2017-03-04.
//  Copyright © 2017 Chris Wong. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    @IBOutlet var urlField: UITextField!

    var menuURL:String?
    var menuBackButtonTapped = false

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Opens the keyboard and focuses on the urlField when theis view appears
    override func viewDidAppear(_ animated: Bool) {
        urlField.becomeFirstResponder()
    }
    
    @IBAction func menuButton1(_ sender: Any) {
        menuURL = "facebook.com"
        urlField.text = menuURL
    }

    @IBAction func menuButton2(_ sender: Any) {
        menuURL = "brainstation.io"
        urlField.text = menuURL
    }
    
    @IBAction func goButton(_ sender: Any) {
        menuURL = urlField.text
    }
    
    @IBAction func backButton(_ sender: Any) {
        menuBackButtonTapped = true
    }
    
    //Passes the text field url and segues to webView when return key is tapped
    @IBAction func urlFieldPrimaryActionTriggered(_ sender: Any) {
        menuURL = urlField.text
        performSegue(withIdentifier: "urlReturn", sender: nil)
    }

    //Passes the text field url when segueing to the WKWebview
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let webViewPage : WKWebViewController = segue.destination as! WKWebViewController
        //webViewPage.url = menuURL
        webViewPage.backButtonTapped = menuBackButtonTapped
        webViewPage.progBar.progress = 0.0
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
