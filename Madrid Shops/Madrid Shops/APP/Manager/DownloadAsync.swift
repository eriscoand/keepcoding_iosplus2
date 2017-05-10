//
//  DownloadAsync.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import CoreData

public protocol DownloadAsync {
    
    func downloadJson(urlString: String, toDecode: String, context: NSManagedObjectContext, completion: @escaping (Void) -> Void, onError:  ErrorClosure?)
    func downloadData(urlString: String, completion: @escaping (Data) -> Void, onError:  ErrorClosure?)
    
}
