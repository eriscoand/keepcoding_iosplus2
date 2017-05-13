//
//  ShopsViewController+Search.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 12/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UISearchBarDelegate

extension ShopsViewController: UISearchBarDelegate{
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        callFetch()
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        callFetch()
        self.searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        callFetch()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        callFetch()
        self.searchBar.resignFirstResponder()
    }
    
    func callFetch(){
        self.fetchedResultsController = Shop.fetchController(context: self.context!, text: self.searchBar.text!)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.collectionView.reloadData()
        }, completion: { finished in
            self.populateLocationList()
            self.showLocationsCenteringRegion()
        })
        
    }
    
}
