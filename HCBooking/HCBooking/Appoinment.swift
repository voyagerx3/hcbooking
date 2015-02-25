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
    var intCompanyBranch: Int
    
    init() {
        intIdProfessional = 0
        dtDate = NSDate()
        intHourIni = 0
        intMinuteIni = 0
        intHourEnd = 0
        intMinuteEnd = 0
        intUser = 0
        intCompanyBranch = 0
    }
    
    init(pDtDate: NSDate, pIntHourIni: Int, pIntMinuteIni: Int, pIntHourEnd: Int,
        pIntMinuteEnd: Int, pIntIdProfessional: Int, pIntCompanyBranch: Int) {
            
        intIdProfessional = pIntIdProfessional
        dtDate = pDtDate
        intHourIni = pIntHourIni
        intMinuteIni = pIntMinuteIni
        intHourEnd = pIntHourEnd
        intMinuteEnd = pIntMinuteEnd
        intUser = 0 // TODO: Por definir usuario
        intCompanyBranch = pIntCompanyBranch
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
    
    // Devuelve un array con las citas de un rango de fechas
    func GetAppoinmentsForDate(pDtDate: NSDate, pIntIdProfessional: Int, pIntHourIni: Int,
            pIntMinuteIni: Int, pIntHourEnd: Int, pIntMinuteEnd: Int,
            pIntCompanyBranch: Int) -> Array<Appoinment> {
            
        var myArray = Array<Appoinment>()
        var myAppoinment = Appoinment()
        
        // TODO: Leer de la base de datos y por cada cita encontrada insertar un objeto
        
        myAppoinment = Appoinment(pDtDate: pDtDate, pIntHourIni: 8,
            pIntMinuteIni: 0, pIntHourEnd: 8, pIntMinuteEnd: 30,
            pIntIdProfessional: pIntIdProfessional, pIntCompanyBranch: pIntCompanyBranch)
                
        myArray.append(myAppoinment)
                
        myAppoinment = Appoinment(pDtDate: pDtDate, pIntHourIni: 10,
            pIntMinuteIni: 30, pIntHourEnd: 11, pIntMinuteEnd: 00,
            pIntIdProfessional: pIntIdProfessional, pIntCompanyBranch: pIntCompanyBranch)
            
        myArray.append(myAppoinment)
        
        return myArray
    }
    
    // Devuelve la hora de apertura y la de cierre del establecimiento
    func GetSchedule(inout pIntHourIni: Int, inout pIntMinuteIni: Int, inout pIntHourEnd: Int,
            inout pIntMinuteEnd: Int) {
                
        // TODO: Obtiene de la base de datos el horario de la peluquería
        pIntHourIni = 8
        pIntMinuteIni = 0
        pIntHourEnd = 21
        pIntMinuteEnd = 0
    }
}