//
//  Version.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

class Version {
    
    class func get() -> String{
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return "Version: \(version)"
        }
        return ""
    }
    
}
