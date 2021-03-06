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

// Obtiene los componentes de una fecha
func GetDateComponents(pDtDate: NSDate) -> NSDateComponents {
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components(.CalendarUnitYear | .CalendarUnitMonth |
        .CalendarUnitDay | .CalendarUnitHour | .CalendarUnitMinute,
        fromDate: pDtDate)
    
    return components
}

// Suma intervalos de tiempo a una fecha
func SumDateIntervals(pDtInicial: NSDate, pCalUnit: NSCalendarUnit, pIntInterval: Int) -> NSDate {
    var dtEnd = NSDate()
    let calendar = NSCalendar.currentCalendar()
    
    dtEnd = calendar.dateByAddingUnit(pCalUnit, value: pIntInterval, toDate: pDtInicial, options: nil)!
    
    return dtEnd
}

// Convierte una fecha en string
func ConvertDateToString(pDtDate: NSDate) -> String{
    let dateFormatter = NSDateFormatter()
    let theDateFormat = NSDateFormatterStyle.ShortStyle
    let theTimeFormat = NSDateFormatterStyle.ShortStyle
    var strDate = String()
    
    dateFormatter.dateStyle = theDateFormat
    dateFormatter.timeStyle = theTimeFormat
    
    strDate = dateFormatter.stringFromDate(pDtDate)
    
    return strDate
}