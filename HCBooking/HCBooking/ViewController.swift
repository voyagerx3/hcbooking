//
//  ViewController.swift
//  HCBooking
//
//  Created by Geovanny Inca on 12/02/15.
//  Copyright (c) 2015 HCBooking. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBLoginViewDelegate  {
    
    @IBOutlet var fbLoginView : FBLoginView!
    @IBOutlet var profilePictureView : FBProfilePictureView!


    
    @IBOutlet weak var TxtEmail: UITextField!
    @IBOutlet weak var TxtPassword: UITextField!
    @IBOutlet weak var LblError: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.fbLoginView.delegate=self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
    }
    
    
    
    //Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
        println("This is where you perform a segue.")
        
        //                    let nuevovc=self.storyboard?.instantiateViewControllerWithIdentifier("VCMenu") as VCMenu
        //                    self.presentViewController(nuevovc, animated: true, completion: nil)
        
        
        
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser){
        println("User Name: \(user.name)")
        profilePictureView.profileID = user.objectID
        LblError.text=user.name
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        LblError.text="User Logged Out"
        profilePictureView.profileID = nil
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
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

