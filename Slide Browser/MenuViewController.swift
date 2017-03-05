//
//  MenuViewController.swift
//  Slide Browser
//
//  Created by Chris Wong on 2017-03-04.
//  Copyright © 2017 Chris Wong. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var menuURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButton1(_ sender: Any) {
        menuURL = "www.facebook.com"
    }

    @IBAction func menuButton2(_ sender: Any) {
        menuURL = "www.brainstation.io"
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
