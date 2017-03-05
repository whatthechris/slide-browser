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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        urlField.becomeFirstResponder()
    }
    
    @IBAction func menuButton1(_ sender: Any) {
        menuURL = "www.facebook.com"
    }

    @IBAction func menuButton2(_ sender: Any) {
        menuURL = "www.brainstation.io"
    }
    
    @IBAction func goButton(_ sender: Any) {
        menuURL = urlField.text
    }
    
    //Passes the text field url and segues to webView when return key is tapped
    @IBAction func urlFieldPrimaryActionTriggered(_ sender: Any) {
        menuURL = urlField.text
        performSegue(withIdentifier: "urlReturn", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var webViewPage : WebViewController = segue.destination as! WebViewController
        webViewPage.url = menuURL
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
