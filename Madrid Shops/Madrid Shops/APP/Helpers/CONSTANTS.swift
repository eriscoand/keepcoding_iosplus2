//
//  CONSTANTS.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

struct CONSTANTS {
    
    static let DBNAME = "Madrid_Shops"
    
    static let REFRESH_EVERY_N_DAYS = 1
    
    static let DEFAULT_LANGUAGE_CODE = "es"
    
    static let SHOPS_URL = "http://madrid-shops.com/json_new/getShops.php"
    static let JSON_ROOT_SHOPS = "result"
    
    static let MAP_IMAGES_URL = "http://maps.googleapis.com/maps/api/staticmap?center=<<LAT>>,<<LNG>>&zoom=17&size=320x220&scale=2&markers=%7Ccolor:0x9C7B14%7C<<LAT>>,<<LNG>>"
    
}
