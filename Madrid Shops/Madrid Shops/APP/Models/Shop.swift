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
    
    convenience init (shop: Shop, context: NSManagedObjectContext){
        
        let entity = NSEntityDescription.entity(forEntityName: Shop.entity().name!, in: context)!
        
        self.init(entity: entity, insertInto: context)
        self.id = shop.id
        self.name = shop.name
        self.address = shop.address
        self.img = shop.img
        self.logo_img = shop.logo_img
        self.telephone = shop.telephone
        
        self.opening_hours_en = shop.opening_hours_en
        self.opening_hours_es = shop.opening_hours_es
        
        self.description_en = shop.description_en
        self.description_es = shop.description_es
        
        self.gps_lat = shop.gps_lat
        self.gps_lng = shop.gps_lng
        
        
        saveContext(context: context)
    }
    
    // MARK: - Get or create
    
    //Gets a Shop from DB. If not exists it creates one
    class func get(shop: Shop,context: NSManagedObjectContext?) -> Shop{
        
        let fr = NSFetchRequest<Shop>(entityName: Shop.entity().name!)
        fr.fetchLimit = 1
        fr.fetchBatchSize = 1
        fr.predicate = NSPredicate(format: "id == \(shop.id)")
        
        do{
            let result = try context?.fetch(fr)
            guard let resp = result else{
                return Shop.init(shop: shop, context: context!)
            }
            if(resp.count > 0){
                return resp.first!
            }else{
                return Shop.init(shop: shop, context: context!)
            }
        } catch{
            return Shop.init(shop: shop, context: context!)
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
