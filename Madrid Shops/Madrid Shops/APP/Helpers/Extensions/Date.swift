//
//  Date.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

extension Date{
    
    static func difference(day1: Date, day2: Date) -> Int{
        let c = (Calendar.current as NSCalendar).components([.day], from: day1, to: day2, options: [])
        return c.day!
    }
    
    static func actualDate() -> String {
        
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        return "\(year)-\(month)-\(day)"
    }
    
}
