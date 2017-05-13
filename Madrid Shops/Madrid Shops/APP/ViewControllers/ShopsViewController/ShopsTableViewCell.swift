//
//  ShopsTableViewCell.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 12/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ShopsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var hoursOpenLabel: UILabel!
    
    var context: NSManagedObjectContext? = nil
    
    var _shop: Shop? = nil
    var shop: Shop{
        get{
            return _shop!
        }
        set{
            _shop = newValue
            
            titleLabel.text = newValue.name?.uppercased()
            hoursOpenLabel.text = newValue.opening_hours
            logoView.imageFromServerURL(urlString: newValue.logo_img!)
            
        }
    }
    
}
