//
//  ViewController.swift
//  Slide Browser
//
//  Created by Chris Wong on 2017-03-04.
//  Copyright © 2017 Chris Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate,  UIScrollViewDelegate{

    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
        
        var V1 : View1 = View1(nibName: "View1", bundle: nil)
        var V2 : View2 = View2(nibName: "View2", bundle: nil)
        
        self.addChildViewController(V1)
        self.scrollView.addSubview(V1.view)
        V1.didMove(toParentViewController: self)
        
        self.addChildViewController(V2)
        self.scrollView.addSubview(V2.view)
        V2.didMove(toParentViewController: self)
        
        V1.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 1.2, height: self.view.frame.height)
        V2.view.frame = CGRect(x: self.view.frame.width * 1.2, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width * 2.2 , height: self.view.frame.size.height)
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if webViewScrolled == true{
            self.scrollView.isScrollEnabled = false
        }else{
            self.scrollView.isScrollEnabled = true
        }
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if webViewScrolled == true{
            self.scrollView.isScrollEnabled = false
        }else{
            self.scrollView.isScrollEnabled = true
        }

   }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

