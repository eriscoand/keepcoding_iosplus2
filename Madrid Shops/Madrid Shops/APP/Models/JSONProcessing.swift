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

func decodeBosses(bosses json: JSONArray, context: NSManagedObjectContext) throws{
    
    let _ = try json.flatMap({try decodeBoss(boss: $0, context: context)})
    
}

func decodeBoss(boss json: JSONDictonary, context: NSManagedObjectContext) throws{
    
    guard let id = json["id"] as? Int64 else {
        throw Errors.wrongJsonFormat
    }
    
    let id = json["id"] as? Int64 ?? 0
    let urlSlug = json["urlSlug"] as? String ?? ""
    let urlSlug = json["urlSlug"] as? String ?? ""
    let description = json["description"] as? String ?? ""
    let zoneId = json["zoneId"] as? Int64 ?? 0
    let level = json["level"] as? Int64 ?? 0
    let health = json["health"] as? Int64 ?? 0
    
    let zone = Zone.get(id: zoneId, context: context)
    
    let _ = Boss.get(id: id, name: name, urlSlug: urlSlug, description: description, zone: zone, level: level, health: health, context: context)
    
}

func decodeZones(zones json: JSONArray, context: NSManagedObjectContext) throws{
    
    let _ = try json.flatMap({try decodeZone(zone: $0, context: context)})
    
}

func decodeZone(zone json: JSONDictonary, context: NSManagedObjectContext) throws{
    
    guard let name = json["name"] as? String else {
        throw Errors.wrongJsonFormat
    }
    
    let id = json["id"] as? Int64 ?? 0
    let urlSlug = json["urlSlug"] as? String ?? ""
    let description = json["description"] as? String ?? ""
    
    let _ = Zone.get(id: id, name: name, urlSlug: urlSlug, description: description, context: context)
    
}






