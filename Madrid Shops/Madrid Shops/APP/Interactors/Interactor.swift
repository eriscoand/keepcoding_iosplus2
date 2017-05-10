//
//  Interactor.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation

public class Interactor{
    
    let manager: DownloadAsync
    
    public init(manager: DownloadAsync){
        self.manager = manager
    }
    
    public convenience init(){
        self.init(manager: DownloadAsyncGCD())
    }
    
}
