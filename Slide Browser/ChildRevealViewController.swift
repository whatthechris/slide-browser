//
//  ChildRevealViewController.swift
//  SWTwoLeftMenus
//
//  Created by Patrick BODET on 17/06/2016.
//  Copyright © 2016 iDevelopper. All rights reserved.
//

import UIKit

class ChildRevealViewController: SWRevealViewController, SWRevealViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

        self.rearViewRevealWidth = 80
        self.rearViewRevealOverdraw = 20
        self.bounceBackOnOverdraw = false
        self.stableDragOnOverdraw = true
        self.rearViewRevealDisplacement = 0

        self.tapGestureRecognizer()
        self.panGestureRecognizer()
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
