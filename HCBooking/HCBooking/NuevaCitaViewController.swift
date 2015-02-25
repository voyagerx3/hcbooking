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
        
        UIDatePicker_Change(datPickDateAppoinment)
    }

    // Se ejecuta al cambiar el valor del selector de fecha
    @IBAction func UIDatePicker_Change(sender: AnyObject) {
        // Obtengo las citas para la fecha seleccionada
        let dateFormatter = NSDateFormatter()
        let theDateFormat = NSDateFormatterStyle.ShortStyle
        let theTimeFormat = NSDateFormatterStyle.ShortStyle
        let calendar = NSCalendar.currentCalendar()
        
        dateFormatter.dateStyle = theDateFormat
        dateFormatter.timeStyle = theTimeFormat
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
        var dtFinalDate = NSDate()
        let calendar = NSCalendar.currentCalendar()
        var intHourEnd, intMinuteEnd: Int
        
        // Obtengo la fecha seleccionada de esta forma para que no me de una hora menos
        dateFormatter.dateStyle = theDateFormat
        dateFormatter.timeStyle = theTimeFormat
        
        strDate = dateFormatter.stringFromDate(datPickDateAppoinment.date)
        dtFinalDate = dateFormatter.dateFromString(strDate)!

        // Obtengo los componentes de la fecha seleccionada para saber la hora fin
        let components = calendar.components(.CalendarUnitYear | .CalendarUnitMonth |
            .CalendarUnitDay | .CalendarUnitHour | .CalendarUnitMinute,
            fromDate: dtFinalDate)
        
        if components.minute == datPickDateAppoinment.minuteInterval {
            intMinuteEnd = 00
            intHourEnd = components.hour + 1
        }
        else {
            intMinuteEnd = datPickDateAppoinment.minuteInterval
            intHourEnd = components.hour
        }
        
       // TODO: Falta saber el profesional y la compañía
        myAppoinment = Appoinment(pDtDate: dtFinalDate, pIntHourIni: components.hour,
            pIntMinuteIni: components.minute, pIntHourEnd: intHourEnd,
            pIntMinuteEnd: intMinuteEnd, pIntIdProfessional: 0, pIntCompanyBranch: 0)
        
        if myAppoinment.FreeSpace(dtFinalDate, pIntIdProfessional: 0, pIntCompanyBranch: 0,
            pIntHourIni: components.hour, pIntMinuteIni: components.minute,
            pIntHourEnd: intHourEnd, pIntMinuteEnd: intMinuteEnd) {
            
        
                if myAppoinment.InsertAppoinmetDDBB() {
                    let myPopup = UIAlertController(title: "Cita creada",
                        message: "La cita se ha creado correctamente",
                        preferredStyle: UIAlertControllerStyle.Alert)
                    
                    myPopup.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
                    
                    self.presentViewController(myPopup, animated: true, completion: nil)
                    
                    // TODO: Actualizar tabla que muestra las citas
                }
                else {
                    let myPopup = UIAlertController(title: "Error",
                        message: "Ha ocurrido un error al crear la cita",
                        preferredStyle: UIAlertControllerStyle.Alert)
                    
                    myPopup.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(myPopup, animated: true, completion: nil)
                }
        }
        else {
            let myPopup = UIAlertController(title: "Hora ocupada",
                message: "No puede crear la cita porque la hora seleccionada ya está en uso",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            myPopup.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(myPopup, animated: true, completion: nil)
        }
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
