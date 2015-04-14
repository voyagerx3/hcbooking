//
//  NuevaCitaTableViewController.swift
//  HCBooking
//
//  Created by Francisco Asensi Benito on 26/2/15.
//  Copyright (c) 2015 HCBooking. All rights reserved.
//

import UIKit

class NuevaCitaTableViewController: UITableViewController {

    @IBOutlet weak var datPickDateAppoinment: UIDatePicker!
    var myAppoinmentArray = Array<Appoinment>()  // Es obligatorio inicializarlo
    var dtDate: NSDate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        // Obtengo las citas del día seleccionado en la pantalla anterior
        GetAppoinmentsDate(dtDate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Obtengo las citas de una fecha
    func GetAppoinmentsDate(pDtDate: NSDate) {
        // Obtengo las citas para la fecha seleccionada
        var myAppoinment = Appoinment()
        var intHourIni, intMInuteIni, intHourEnd, intMinuteEnd, intIdProfessional,
        intCompanyBranch: Int
        
        intHourIni = 0
        intHourEnd = 0
        intMinuteEnd = 0
        intMInuteIni = 0
        
        // TODO: Otener id y companybranch
        
        // Obtengo la hora de apertura y de cierre del establecimiento
        myAppoinment.GetSchedule(&intHourIni, pIntMinuteIni: &intMInuteIni,
            pIntHourEnd: &intHourEnd, pIntMinuteEnd: &intMinuteEnd,
            pIntIdProfessional: 0, pIntCompanyBranch: 0)
        
        // Obtengo las citas del día
        myAppoinmentArray = myAppoinment.GetAppoinmentsForDate(pDtDate,
            pIntIdProfessional: 0, pIntOpeningHour: intHourIni, pIntOpeningMinute: intMInuteIni,
            pIntClosingHour: intHourEnd, pIntClosingMinute: intMinuteEnd, pIntCompanyBranch: 0)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myAppoinmentArray.count
    }

    // Este método es obligatorio porque si no lo implementamos, la aplicación no se ejecuta.
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Mostramos el contacto que estemos recorriendo en cada momento
        let appoin = myAppoinmentArray[indexPath.row]
        var strMinuteIni: String = String(appoin.intMinuteIni)
        
        if count(strMinuteIni) == 1 {
            strMinuteIni += "0"
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Citas", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = appoin.strUserName
        cell.detailTextLabel?.text = String(appoin.intHourIni) + ":" + strMinuteIni
        cell.tag = indexPath.row
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if identifier == "gotoNuevaCitaFromListado" {
            var celda = sender as! UITableViewCell
            var myAppoinment = Appoinment()

            myAppoinment = myAppoinmentArray[celda.tag]
            
            if myAppoinment.strUserName == "" {
                return true
            }
            else {
                var alertView: UIAlertController = UIAlertController(title: "Ocupado", message: "El turno seleccionado está ocupado", preferredStyle: UIAlertControllerStyle.Alert)
                alertView.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertView, animated: true, completion: nil)
                
                return false
            }
        }
        else {
            return false
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotoNuevaCitaFromListado" {
            let vc = segue.destinationViewController as! NuevaCitaViewController
            var celda = sender as! UITableViewCell
            
            vc.myAppoinment = myAppoinmentArray[celda.tag]
        }
    }
}
