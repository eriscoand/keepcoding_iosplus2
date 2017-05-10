//
//  JSONProcessing.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class DownloadAsyncGCD: DownloadAsync {
    
    //Background Task Identifier
    var backgroundUpdateTask: UIBackgroundTaskIdentifier!
    
    //Begin the background task
    func beginBackgroundUpdateTask() {
        self.backgroundUpdateTask = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            self.endBackgroundUpdateTask()
        })
    }
    
    //End the background task
    func endBackgroundUpdateTask() {
        UIApplication.shared.endBackgroundTask(self.backgroundUpdateTask)
        self.backgroundUpdateTask = UIBackgroundTaskInvalid
    }
    
    //Download & Parse Json from url
    public func downloadJson(urlString: String, toDecode: String, context: NSManagedObjectContext, completion: @escaping (Void) -> Void, onError:  ErrorClosure?){
        
        DispatchQueue.global().async {
            do{
                self.beginBackgroundUpdateTask()
                
                let json_data = try getFileFrom(urlString: urlString)
                let json = try jsonLoadFromData(dataInput: json_data, toDecode: toDecode)
                
                switch toDecode {
                case "bosses":
                    try decodeBosses(bosses: json, context: context)
                case "zones":
                    try decodeZones(zones: json, context: context)
                default:
                    try decodeZones(zones: json, context: context)
                }
                
                sleep(20)
                
                DispatchQueue.main.async {
                    completion()
                }
                
                self.endBackgroundUpdateTask()
                
            } catch {
                if let errorClosure = onError {
                    errorClosure(error)
                }
            }
        }
        
    }
    
    //Download any type of Data from url
    public func downloadData(urlString: String, completion: @escaping (Data) -> Void, onError:  ErrorClosure?){
        
        DispatchQueue.global().async {
            //let data = try getFileFrom(urlString: urlString) //--OLD getting data and saving it to Library
            
            self.beginBackgroundUpdateTask()
            
            var data = Data()
            if let url = URL.init(string: urlString){
                do{
                    data = try Data.init(contentsOf: url)
                }catch{
                    data = Data()
                }
            }
            
            DispatchQueue.main.async {
                completion(data)
            }
            
            self.endBackgroundUpdateTask()
            
        }
        
    }
    
}