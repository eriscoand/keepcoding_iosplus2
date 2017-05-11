//
//  JSONInteractor.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import CoreData

public class JSONInteractor: Interactor {
    
    public func execute(urlString: String, toDecode: String, context: NSManagedObjectContext, completion: @escaping (Void) -> Void, onError: @escaping (Void) -> Void) {
        
        manager.downloadJson(urlString: urlString, toDecode: toDecode, context: context,
        completion: { (Void) in
            completion()
        }, onError: { (Void) in
            onError()
        })
    }
    
}
    
