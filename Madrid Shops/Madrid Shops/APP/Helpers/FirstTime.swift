//
//  FirstTime.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

public func refresh() -> Bool {
    let userDef = UserDefaults.standard
    let stringDateLastRefresh = userDef.string(forKey: "dateLastRefresh")
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    
    if  let sDate = stringDateLastRefresh,
        let date = dateFormatter.date(from: sDate){
        let diff = Date.difference(day1: date, day2: Date())
        if diff < CONSTANTS.REFRESH_EVERY_DAYS {
            return false
        }
    }
    
    return true
}

public func setRefresh() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    let newDate = dateFormatter.string(from: Date())
    
    let userDef = UserDefaults.standard
    userDef.set(newDate, forKey: "dateLastRefresh")
}
