//
//  ShopsViewController+Fetched.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import CoreData

extension ShopsViewController: NSFetchedResultsControllerDelegate {
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .insert:
            self.collectionView.insertSections(IndexSet(integer: sectionIndex), with: .top)
        case .delete:
            self.collectionView.deleteSections(IndexSet(integer: sectionIndex), with: .top)
        default:
            return
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            self.collectionView.insertRows(at: [newIndexPath!], with: .top)
        case .delete:
            self.collectionView.deleteRows(at: [indexPath!], with: .top)
        default:
            break
        }
    }
    
}
