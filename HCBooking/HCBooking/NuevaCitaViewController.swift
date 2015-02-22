//
//  NuevaCitaViewController.swift
//  HCBooking
//
//  Created by Francisco Asensi Benito on 19/2/15.
//  Copyright (c) 2015 HCBooking. All rights reserved.
//

import UIKit

class NuevaCitaViewController: UIViewController {

    @IBOutlet weak var datPickDateAppoinment: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Establezco la hora actual, para que no me coja como hora las 10:07
        var dtDate = NSDate()
        
        dtDate = GetExcactCurrentDate(dtDate)
        datPickDateAppoinment.date = dtDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Al hacer click en OK guardamos la nueva cita en la base de datos
    @IBAction func BT_Done_Click(sender: AnyObject) {
        var myAppoinment = Appoinment()
        let dateFormatter = NSDateFormatter()
        let theDateFormat = NSDateFormatterStyle.ShortStyle
        let theTimeFormat = NSDateFormatterStyle.ShortStyle
        var strDate = String()
        
        dateFormatter.dateStyle = theDateFormat
        dateFormatter.timeStyle = theTimeFormat
        
        strDate = dateFormatter.stringFromDate(datPickDateAppoinment.date)
        println("\(strDate)")
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
