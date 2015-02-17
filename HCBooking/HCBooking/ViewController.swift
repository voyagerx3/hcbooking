//
//  ViewController.swift
//  HCBooking
//
//  Created by Geovanny Inca on 12/02/15.
//  Copyright (c) 2015 HCBooking. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TxtEmail: UITextField!
    
    @IBOutlet weak var TxtPassword: UITextField!
   
    @IBOutlet weak var LblError: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BtnLoginFacebook(sender: AnyObject) {
    }
    
    @IBAction func BtnLogin(sender: AnyObject) {
        if TxtPassword?.text=="1234"
        {
            let nuevovc=self.storyboard?.instantiateViewControllerWithIdentifier("VCMenu") as VCMenu
            self.presentViewController(nuevovc, animated: true, completion: nil)
        }
        else
        {
            self.LblError.text="Error ....."
        }
        
    }
    
    
    @IBAction func BtnDateAlta(sender: AnyObject) {
    }
    
    
    
    

    
    
}

