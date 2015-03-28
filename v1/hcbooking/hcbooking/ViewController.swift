//
//  ViewController.swift
//  hcbooking
//
//  Created by Geovanny Inca on 23/03/15.
//  Copyright (c) 2015 Geovanny Inca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lbnVcName: UILabel!
    
    @IBOutlet weak var lbnVcAddress: UILabel!
    
    @IBOutlet weak var lbnVcPhones: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        goto_load()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
//        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
//        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
//        if (isLoggedIn != 1) {
//            //self.performSegueWithIdentifier("goto_login", sender: self)
//            let nuevovc=self.storyboard?.instantiateViewControllerWithIdentifier("VCLogin") as VCLogin
//            self.presentViewController(nuevovc, animated: true, completion: nil)
//        } else {
//            //VCMenu.lblUserName.text = prefs.valueForKey("USERNAME") as NSString
//            let nuevovc=self.storyboard?.instantiateViewControllerWithIdentifier("VCMenu") as VCMenu
//            self.presentViewController(nuevovc, animated: true, completion: nil)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func goto_load()
    {
        var VcNameCompany:NSString = "dos"
        var IntIdCompany:NSString = "2"
        
        
        var post:NSString = "VcNameCompany=\(VcNameCompany)&IntIdCompany=\(IntIdCompany)"
        
        NSLog("PostData: %@",post);
        
        var url:NSURL = NSURL(string: "http://cr.crazyvity.com/hcb/jsoncompany.php")!
        
        var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
        
        var postLength:NSString = String( postData.length )
        
        var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData
        request.setValue(postLength, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        
        var reponseError: NSError?
        var response: NSURLResponse?
        
        var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
        
        if ( urlData != nil ) {
            let res = response as NSHTTPURLResponse!;
            
            NSLog("Response code: %ld", res.statusCode);
            
            if (res.statusCode >= 200 && res.statusCode < 300)
            {
                var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                
                NSLog("Response ==> %@", responseData);
                
                var error: NSError?
                
                let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as NSDictionary
                
                
                let success:NSInteger = jsonData.valueForKey("success") as NSInteger
                let VCName:NSString = jsonData.valueForKey("VCName") as NSString
                let VcAddress:NSString = jsonData.valueForKey("VcAddress") as NSString
                let VcPhones:NSString = jsonData.valueForKey("VcPhones") as NSString
                
                //[jsonData[@"success"] integerValue];
                
                NSLog("Success: %ld", success);
                
                if(success == 1)
                {
                    NSLog("Load Up SUCCESS");
                    lbnVcName.text=VCName
                    lbnVcAddress.text=VcAddress
                    lbnVcPhones.text=VcPhones
                    
                    //self.dismissViewControllerAnimated(true, completion: nil)
                    
                } else {
                    var error_msg:NSString
                    
                    if jsonData["error_message"] as? NSString != nil {
                        error_msg = jsonData["error_message"] as NSString
                    } else {
                        error_msg = "Unknown Error"
                    }
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Load Up Failed!"
                    alertView.message = error_msg
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                    
                }
                
            } else {
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Load Up Failed!"
                alertView.message = "Connection Failed"
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
        }  else {
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Load in Failed!"
            alertView.message = "Connection Failure"
            if let error = reponseError {
                alertView.message = (error.localizedDescription)
            }
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        }
        
        
        
    }

    @IBAction func btngotoVCLogin(sender: AnyObject?) {
        performSegueWithIdentifier("gotoVCLogin", sender: self)
    }
    
}

