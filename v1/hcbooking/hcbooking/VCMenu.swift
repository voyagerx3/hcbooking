//
//  VCMenu.swift
//  hcbooking
//
//  Created by Geovanny Inca on 23/03/15.
//  Copyright (c) 2015 Geovanny Inca. All rights reserved.
//
import UIKit
import Foundation
class VCMenu: UIViewController {
    @IBOutlet weak var lblUserName: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        if (isLoggedIn != 1) {
            self.performSegueWithIdentifier("goto_login", sender: self)
        } else {
            self.lblUserName.text = prefs.valueForKey("USERNAME") as NSString

        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        

    }
    
    
    @IBAction func btnLogout(sender: AnyObject) {
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        //self.performSegueWithIdentifier("gotoVCLogin", sender: self)
        let nuevovc=self.storyboard?.instantiateViewControllerWithIdentifier("VCLogin") as VCMenu
        self.presentViewController(nuevovc, animated: true, completion: nil)
        
    }
}
