//
//  FuncionesFran.swift
//  HCBooking
//
//  Created by Francisco Asensi Benito on 21/2/15.
//  Copyright (c) 2015 HCBooking. All rights reserved.
//

import Foundation

// MARK: - Funciones fecha

// Obtiene la fecha y hora exacta más próxima a una fecha
func GetExcactCurrentDate(pDate: NSDate) -> NSDate {
    var dtNewDate: NSDate
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components(.CalendarUnitYear | .CalendarUnitMonth |
        .CalendarUnitDay | .CalendarUnitHour | .CalendarUnitMinute,
        fromDate: pDate)
    
    components.second = 00
    
    if components.minute > 30 {
        components.minute = 00
        components.hour += 1
    }
    else {
        components.minute = 30
    }
    
    dtNewDate = calendar.dateFromComponents(components)!
    
    return dtNewDate
}