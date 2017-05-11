//
//  JSONProcessing.swift
//  WOWBosses
//
//  Created by Eric Risco de la Torre on 04/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit
import CoreData

//MARK: - Functions

func jsonLoadFromData(dataInput data: Data, toDecode: String) throws -> JSONArray{
    
    guard let root = try? JSONSerialization.jsonObject(with: data, options: []) else{
        throw Errors.wrongJsonFormat
    }
    
    guard let dictionary = root as? JSONDictonary else{
        throw Errors.wrongJsonFormat
    }
    
    guard let maybeArray = dictionary[toDecode] as? JSONArray else{
        throw Errors.wrongJsonFormat
    }
    
    return maybeArray
}

func decodeShops(json: JSONArray, context: NSManagedObjectContext) throws{
    
    let _ = try json.flatMap({try decodeShop(json: $0, context: context)})
    
}

func decodeShop(json: JSONDictonary, context: NSManagedObjectContext) throws{
    
    guard let id = json["id"] as? String else {
        throw Errors.wrongJsonFormat
    }
    
    let _ = Shop.get(id: id, json: json, context: context)
    
}






