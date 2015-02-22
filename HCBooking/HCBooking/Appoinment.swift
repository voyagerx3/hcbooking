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
}