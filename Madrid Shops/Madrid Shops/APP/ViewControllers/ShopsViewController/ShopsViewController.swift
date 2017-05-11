//
//  ShopsViewController.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import MapKit
import UIKit
import CoreData

class ShopsViewController: UIViewController {
    
    lazy var searchBar = UISearchBar()

    var context: NSManagedObjectContext?
    var fetchedResultsController: NSFetchedResultsController<Shop>? = nil
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let _ = context else { return }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
