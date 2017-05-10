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
        let logoImage = UIImage(named: "logo.png")!
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        imageView.contentMode = .scaleAspectFit
        
        imageView.image = logoImage
        self.titleView = imageView
        self.titleView?.alpha = 1
    }
    
}
