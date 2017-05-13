//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 13/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {
    
    var shop: Shop? = nil

    @IBOutlet weak var mapImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var textLabel: UITextView!
    @IBOutlet weak var openedLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let replaced = (CONSTANTS.MAP_IMAGES_URL as NSString).replacingOccurrences(of: "<<LAT>>", with: (shop?.gps_lat)!).replacingOccurrences(of: "<<LNG>>", with: (shop?.gps_lng)!)
        mapImage.imageFromServerURL(urlString: replaced)
        
        nameLabel.text = shop?.name
        textLabel.text = shop?.text
        openedLabel.text = shop?.opening_hours
        addressLabel.text = shop?.address
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
