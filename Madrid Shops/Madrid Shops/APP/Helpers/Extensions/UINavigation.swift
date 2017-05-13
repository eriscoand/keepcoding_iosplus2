//
//  UINavigation.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
    
    func transparentNavigationBar() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.isTranslucent = true
    }
    
    func appNavigationBar(){
        self.barTintColor = UIColor.black
        self.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.isTranslucent = false
    }
    
}

extension UINavigationItem {
    
    func setLogo(){
        self.title = "Madrid Shops"
        self.titleView?.alpha = 1
    }
    
}
