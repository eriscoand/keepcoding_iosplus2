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
    
    // MARK: - Init
    
    convenience init (json: JSONDictonary, context: NSManagedObjectContext){
        
        let entity = NSEntityDescription.entity(forEntityName: Shop.entity().name!, in: context)!
        
        self.init(entity: entity, insertInto: context)
        self.id = json["id"] as? String ?? "0"
        self.name = json["name"] as? String ?? ""
        self.address = json["address"] as? String ?? ""
        self.img = json["img"] as? String ?? ""
        self.logo_img = json["logo_img"] as? String ?? ""
        self.telephone = json["telephone"] as? String ?? ""
        
        self.opening_hours_en = json["opening_hours_en"] as? String ?? ""
        self.opening_hours_es = json["opening_hours_es"] as? String ?? ""
        
        self.description_en = json["description_en"] as? String ?? ""
        self.description_es = json["description_es"] as? String ?? ""
        
        self.gps_lat = json["gps_lat"] as? String ?? ""
        self.gps_lng = json["gps_lng"] as? String ?? ""
        
        
        saveContext(context: context)
    }
    
    // MARK: - Get or create
    
    //Gets a Shop from DB. If not exists it creates one
    class func get(id: String, json: JSONDictonary?, context: NSManagedObjectContext?) -> Shop{
        
        let fr = NSFetchRequest<Shop>(entityName: Shop.entity().name!)
        fr.fetchLimit = 1
        fr.fetchBatchSize = 1
        fr.predicate = NSPredicate(format: "id == \(id)")
        
        do {
            if let result = try context?.fetch(fr), result.count > 0 {
                return result.first!
            }else if let dict = json {
                return Shop.init(json: dict, context: context!)
            }
        }catch{
            return Shop.init()
        }
        
        return Shop.init()
        
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
