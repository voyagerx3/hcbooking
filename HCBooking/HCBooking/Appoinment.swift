//
//  Appoinment.swift
//  HCBooking
//
//  Created by Francisco Asensi Benito on 20/2/15.
//  Copyright (c) 2015 HCBooking. All rights reserved.
//

import Foundation

class Appoinment {
    var intIdProfessional: Int
    var dtDate: NSDate
    var intHourIni: Int
    var intMinuteIni: Int
    var intHourEnd: Int
    var intMinuteEnd: Int
    var intUser: Int
    var strUserName: String
    var intCompanyBranch: Int
    var intAppoinmentMinuteInterval: Int
    
    init() {
        intIdProfessional = 0
        dtDate = NSDate()
        intHourIni = 0
        intMinuteIni = 0
        intHourEnd = 0
        intMinuteEnd = 0
        intUser = 0
        intCompanyBranch = 0
        strUserName = ""
        intAppoinmentMinuteInterval = 0
    }
    
    init(pDtDate: NSDate, pIntHourIni: Int, pIntMinuteIni: Int, pIntHourEnd: Int,
        pIntMinuteEnd: Int, pIntIdProfessional: Int, pIntCompanyBranch: Int,
        pStrUserName: String) {
            
        intIdProfessional = pIntIdProfessional
        dtDate = pDtDate
        intHourIni = pIntHourIni
        intMinuteIni = pIntMinuteIni
        intHourEnd = pIntHourEnd
        intMinuteEnd = pIntMinuteEnd
        intUser = 0 // TODO: Por definir usuario
        strUserName = pStrUserName
        intCompanyBranch = pIntCompanyBranch
        
        intAppoinmentMinuteInterval = 0
        intAppoinmentMinuteInterval = GetAppoinmentInteval(intIdProfessional, pIntIdCompanyBranch: intCompanyBranch)
    }
    
    deinit {
        intIdProfessional = 0
        dtDate = NSDate()
        intHourIni = 0
        intMinuteIni = 0
        intHourEnd = 0
        intMinuteEnd = 0
        intUser = 0
        intCompanyBranch = 0
        strUserName = ""
        intAppoinmentMinuteInterval = 0
    }
    
    // Inserta una nueva cita en la base de datos e indica si el insert ha sido
    // correcto
    func InsertAppoinmetDDBB() -> Bool {
        // TODO: Por implementar
        return true
    }
    
    // Borra una cita de la base de datos e indica si ha ido bien
    func DeleteAppoinmentDDBB() -> Bool {
        // TODO: Por implementar
        return true
    }
    
    // Indica si el hueco está libre
    func FreeSpace(pDtDate: NSDate, pIntIdProfessional: Int, pIntCompanyBranch: Int,
        pIntHourIni: Int, pIntMinuteIni: Int, pIntHourEnd: Int, pIntMinuteEnd: Int) -> Bool {
            
        // TODO: Por implementar
        return true
    }
    
    // Devuelve el intervalo entre citas en minutos
    func GetAppoinmentInteval(pIntIdProfessional: Int, pIntIdCompanyBranch: Int) -> Int {
        var intInterval: Int = 0
        
        // TODO: Obtener de la BBDD
        intInterval = 30
        
        return intInterval
    }
    
    // Devuelve el número de intervalos que hay entre la apertura y el cierre
    func GetCountIntervals(pIntOpeningHour: Int, pIntOpeningMinute: Int, pIntClosingHour: Int,
        pIntClosingMinute: Int, pIntAppoinmentInterval: Int, inout pArray: Array<Appoinment>,
        pIntIdProfessional: Int, pIntCompanyBranch: Int, pDtDate: NSDate) -> Int {
                
        var intCountIntervals: Int
        var dtcOpeningHour = NSDateComponents()
        var dtcClosingHour = NSDateComponents()
        var dtAux = NSDate()
        let calendar = NSCalendar.currentCalendar()
        var boolFinalize: Bool = false
        var myAppoinment = Appoinment()
                
        dtcOpeningHour.hour = pIntOpeningHour
        dtcOpeningHour.minute = pIntOpeningMinute
        dtcClosingHour.hour = pIntClosingHour
        dtcClosingHour.minute = pIntClosingMinute
        intCountIntervals = 0
            
        do {
            // Compruebo si en esta hora hay una cita
            // TODO: Leerlas de la base de datos
            if (dtcOpeningHour.hour == 8) && (dtcOpeningHour.minute == 0) {
                myAppoinment = Appoinment(pDtDate: pDtDate, pIntHourIni: 8,
                    pIntMinuteIni: 0, pIntHourEnd: 8, pIntMinuteEnd: 30,
                    pIntIdProfessional: pIntIdProfessional, pIntCompanyBranch: pIntCompanyBranch,
                    pStrUserName: "Paco")
            }
            else if (dtcOpeningHour.hour == 11) && (dtcOpeningHour.minute == 30) {
                myAppoinment = Appoinment(pDtDate: pDtDate, pIntHourIni: 11,
                    pIntMinuteIni: 30, pIntHourEnd: 12, pIntMinuteEnd: 00,
                    pIntIdProfessional: pIntIdProfessional, pIntCompanyBranch: pIntCompanyBranch,
                    pStrUserName: "Ana")
            }
            else {
                myAppoinment = Appoinment(pDtDate: pDtDate, pIntHourIni: dtcOpeningHour.hour,
                    pIntMinuteIni: dtcOpeningHour.minute, pIntHourEnd: 12, pIntMinuteEnd: 00,
                    pIntIdProfessional: pIntIdProfessional, pIntCompanyBranch: pIntCompanyBranch,
                    pStrUserName: "")
            }
            
            pArray.append(myAppoinment)
            
            if (dtcOpeningHour.hour == dtcClosingHour.hour) && (dtcOpeningHour.minute == dtcClosingHour.minute) {
                boolFinalize = true
            }
            else {
                dtAux = calendar.dateFromComponents(dtcOpeningHour)!
                dtAux = SumDateIntervals(dtAux, NSCalendarUnit.CalendarUnitMinute, pIntAppoinmentInterval)
                dtcOpeningHour = GetDateComponents(dtAux)
            }
            
            intCountIntervals += 1;
        } while !boolFinalize

        return intCountIntervals
    }
    
    // Devuelve un array con las citas de un rango de fechas
    func GetAppoinmentsForDate(pDtDate: NSDate, pIntIdProfessional: Int, pIntOpeningHour: Int,
            pIntOpeningMinute: Int, pIntClosingHour: Int, pIntClosingMinute: Int,
            pIntCompanyBranch: Int) -> Array<Appoinment> {
            
        var myArray = Array<Appoinment>()
        var intAppoinmentInterval = Int()
                
        intAppoinmentInterval = GetAppoinmentInteval(pIntIdProfessional, pIntIdCompanyBranch: pIntCompanyBranch)

        // Obtengo el número de intervalos de un día y el array de citas del día
        var intCountIntervals: Int = GetCountIntervals(pIntOpeningHour, pIntOpeningMinute: pIntOpeningMinute,
            pIntClosingHour: pIntClosingHour, pIntClosingMinute: pIntClosingMinute,
            pIntAppoinmentInterval: intAppoinmentInterval, pArray: &myArray,
            pIntIdProfessional: pIntIdProfessional, pIntCompanyBranch: pIntCompanyBranch,
            pDtDate: pDtDate)
        
        return myArray
    }
    
    // Func
    
    // Devuelve la hora de apertura y la de cierre del establecimiento
    func GetSchedule(inout pIntHourIni: Int, inout pIntMinuteIni: Int, inout pIntHourEnd: Int,
        inout pIntMinuteEnd: Int, pIntIdProfessional: Int, pIntCompanyBranch: Int) {
            
        // TODO: Obtiene de la base de datos el horario de la peluquería
        pIntHourIni = 8
        pIntMinuteIni = 0
        pIntHourEnd = 21
        pIntMinuteEnd = 0
    }
}