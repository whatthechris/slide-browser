//
//  URLVC.swift
//  Slide Browser
//
//  Created by Chris Wong on 2017-03-20.
//  Copyright © 2017 Chris Wong. All rights reserved.
//

import UIKit

var url:String?

class URLVC: UIViewController {
    

    @IBOutlet var urlField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goButton(_ sender: Any) {
        url = urlField.text
        WKWebViewController.load()
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
