//
//  ViewController.swift
//  Slide Browser
//
//  Created by Chris Wong on 2017-03-04.
//  Copyright © 2017 Chris Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var V1 : View1 = View1(nibName: "View1", bundle: nil)
        var V2 : View2 = View2(nibName: "View2", bundle: nil)
        var V3 : View3 = View3(nibName: "View3", bundle: nil)
        
        self.addChildViewController(V1)
        self.scrollView.addSubview(V1.view)
        V1.didMove(toParentViewController: self)
        
        self.addChildViewController(V2)
        self.scrollView.addSubview(V2.view)
        V2.didMove(toParentViewController: self)
        
        self.addChildViewController(V3)
        self.scrollView.addSubview(V3.view)
        V3.didMove(toParentViewController: self)
        
        V2.view.frame = CGRect(x: self.view.frame.width, y: 0, width: 100, height: self.view.frame.height)
        
        var V3Frame : CGRect = V3.view.frame
        V3Frame.origin.x = 2 * self.view.frame.width - (self.view.frame.width - 100)
        V3.view.frame = V3Frame
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 2.5 , height: self.view.frame.size.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

