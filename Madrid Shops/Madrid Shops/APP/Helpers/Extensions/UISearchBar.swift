//
//  UISearchBar.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    
    func changeUI() {
        for subView in self.subviews {
            
            for subViewOne in subView.subviews {
                
                if let textField = subViewOne as? UITextField {
                    
                    subViewOne.backgroundColor = UIColor.red
                    
                    //use the code below if you want to change the color of placeholder
                    let textFieldInsideUISearchBarLabel = textField.value(forKey: "placeholderLabel") as? UILabel
                    textFieldInsideUISearchBarLabel?.textColor = UIColor.blue
                }
            }
        }
    }
    
}
