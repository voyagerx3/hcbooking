//
//  NuevaCitaViewController.swift
//  HCBooking
//
//  Created by Francisco Asensi Benito on 16/3/15.
//  Copyright (c) 2015 HCBooking. All rights reserved.
//

import UIKit

class NuevaCitaViewController: UIViewController {
    var myAppoinment = Appoinment()
    @IBOutlet weak var uiDtPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        println(myAppoinment.intHourIni)
        println(myAppoinment.intMinuteIni)
        // TODO: Crear componentes de fecha y asignarla al datepicker
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
