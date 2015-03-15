//
//  SeleccionDiaViewController.swift
//  HCBooking
//
//  Created by Francisco Asensi Benito on 1/3/15.
//  Copyright (c) 2015 HCBooking. All rights reserved.
//

import UIKit

class SeleccionDiaViewController: UIViewController {

    @IBOutlet weak var dtPicDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotoListaCitasFromSeleccionDia" {
            let vc = segue.destinationViewController as NuevaCitaTableViewController
            vc.dtDate = dtPicDate.date
        }
    }
}
