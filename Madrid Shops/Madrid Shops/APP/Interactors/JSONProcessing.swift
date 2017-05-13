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

func shopDecode(json: JSONArray, context: NSManagedObjectContext) throws {
    let _ = try json.flatMap({try Shop.init(json: $0, context: context)})
}

func parse<T>(json: JSONDictonary, key: String) throws -> T {
    guard let value: T = try? value(json: json, forKey: key) else {
        throw Errors.keyNotFound(key)
    }
    return value
}

private func value<T>(json: JSONDictonary, forKey key: String) throws -> T {
    guard let value = json[key] as? T else { throw Errors.keyNotFound(key) }
    return value
}






