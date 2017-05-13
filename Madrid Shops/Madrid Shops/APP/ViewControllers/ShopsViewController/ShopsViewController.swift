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
    
    //Searchbar
    lazy var searchBar = UISearchBar()

    //CoreData
    var context: NSManagedObjectContext?
    var fetchedResultsController: NSFetchedResultsController<Shop>? = nil
    
    //Location
    var locationManager : CLLocationManager?
    var location: CLLocation?
    var locationList: [MapPin]?
    
    //Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var collectionView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let _ = context else { return }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchedResultsController?.delegate = self
        
        populateLocationList()
        showLocationsCenteringRegion()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        
        if navigationItem.titleView == searchBar {
            showLogo()
        }else{
            showSeachBar()
        }
        
    }
    
    func showLogo(){
        self.navigationItem.titleView = nil
        
        self.searchBar.alpha = 1
        self.navigationItem.titleView?.alpha = 0
        
        self.searchBar.alpha = 0
        self.navigationItem.setLogo()
        self.searchBar.text = ""
        self.callFetch()
    }
    
    func showSeachBar(){
        navigationItem.setLeftBarButton(nil, animated: true)
        self.searchBar.alpha = 0
        navigationItem.titleView = searchBar
        
        self.searchBar.alpha = 1
        self.searchBar.becomeFirstResponder()
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier
            {
            case "ShopDetailSegue":
                let selectedIndex = collectionView.indexPathForSelectedRow
                let shop = fetchedResultsController?.object(at: selectedIndex!)
                let vc = segue.destination as! ShopDetailViewController
                vc.shop = shop
            default:
                break
            }
        }
    }

}
