//
//  UIImageView.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        let image = UIImage(named: "madrid")
        if(self.image == nil){
            self.image = image
        }
        
        if urlString != "" {
            DispatchQueue.global().async {
                do{
                    let d = try getFileFrom(urlString: urlString)
                    DispatchQueue.main.async {
                        let image = UIImage(data: d)
                        self.image = image
                    }
                }catch{
                    
                }
            }
        }
        
    }
    
}
