//
//  Shop.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import CoreData

extension Shop {
    
    // MARK - Getting shop info for the phone language
    
    var opening_hours: String {
        if getPhoneLanguage() == CONSTANTS.DEFAULT_LANGUAGE_CODE {
            return self.opening_hours_es!
        }else{
            return self.opening_hours_en!
        }
    }
    
    var text: String {
        if getPhoneLanguage() == CONSTANTS.DEFAULT_LANGUAGE_CODE {
            return self.description_es!
        }else{
            return self.description_en!
        }
    }
    
    // MARK: - Init with JSON
    
    convenience init(json: JSONDictonary, context: NSManagedObjectContext) throws {
    
        let entity = NSEntityDescription.entity(forEntityName: Shop.entity().name!, in: context)
        
        do{
            
            self.init(entity: entity!, insertInto: context)
            
            self.id = try parse(json: json, key: "id")
            
            self.name = try parse(json: json, key: "name")
            self.address = try parse(json: json, key: "address")
            self.img = try parse(json: json, key: "img")
            self.logo_img = try parse(json: json, key: "logo_img")
            self.telephone = try parse(json: json, key: "telephone")
            
            self.opening_hours_en = try parse(json: json, key: "opening_hours_en")
            self.opening_hours_es = try parse(json: json, key: "opening_hours_es")
            
            self.description_en = try parse(json: json, key: "description_en")
            self.description_es = try parse(json: json, key: "description_es")
            
            self.gps_lat = try parse(json: json, key: "gps_lat")
            self.gps_lat = self.gps_lat?.trimmingCharacters(in: .whitespaces)
            self.gps_lng = try parse(json: json, key: "gps_lon")
            self.gps_lng = self.gps_lng?.trimmingCharacters(in: .whitespaces)
            
        }catch{
            throw Errors.wrongJsonFormat
        }
        
    }
    
    //Fetch Shop Controller
    class func fetchController(context: NSManagedObjectContext, text: String) -> NSFetchedResultsController<Shop>{
        
        let frc = NSFetchedResultsController(fetchRequest: Shop.fetchRequest(text: text),
                                             managedObjectContext: context,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
        
        do {
            try frc.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return frc
    }
    
    //Fetch Request for a text
    class func fetchRequest(text: String) -> NSFetchRequest<Shop>{
        
        let fr = NSFetchRequest<Shop>(entityName: Shop.entity().name!)
        
        // Set the batch size to a suitable number.
        fr.fetchBatchSize = 20
        
        if(text != ""){
            let t = text.lowercased()
            
            let namePredicate = NSPredicate(format: "name contains [cd] %@",t)
            let description_enPredicate = NSPredicate(format: "description_en contains [cd] %@",t)
            let description_esPredicate = NSPredicate(format: "description_es contains [cd] %@",t)
            
            let predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [namePredicate, description_enPredicate, description_esPredicate])
            fr.predicate = predicate
            
        }
        
        //Sorting
        fr.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]
        
        return fr
        
    }
    
}
