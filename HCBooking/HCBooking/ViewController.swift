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
        //INICIO FRAN 190215 Se comenta porque creo que es mejor de otra forma
        /*if TxtPassword?.text=="1234"
        {
            let nuevovc=self.storyboard?.instantiateViewControllerWithIdentifier("VCMenu") as VCMenu
            self.presentViewController(nuevovc, animated: true, completion: nil)
        }
        else
        {
            self.LblError.text="Error ....."
            return
        }*/
        //FIN FRAN 190215
    }
    
    // INICIO FRAN 190215 Se ejecuta al intentar ir a otra pantalla, podemos cancelar el enlace si falta algún dato
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if TxtPassword.text != "1234" {
            LblError.hidden = false
            LblError.text = "Error ....."
            
            return false
        }
        else
        {
            LblError.hidden = true
            
            return true
        }
    }
    
    
    @IBAction func BtnDateAlta(sender: AnyObject) {
    }
    
    
    
    

    
    
}

