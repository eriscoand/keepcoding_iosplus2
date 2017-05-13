//
//  LoadingViewController.swift
//  MadridShops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import Foundation
import Pulsator
import CoreData

class LoadingViewController: UIViewController {
    
    @IBOutlet weak var logoView: UIImageView!
    
    var context: NSManagedObjectContext?
    
    let pulsator = Pulsator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pulsatorInit()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.layer.layoutIfNeeded()
        pulsator.position = logoView.layer.position
    }
    
    func pulsatorInit(){
        logoView.layer.superlayer?.insertSublayer(pulsator, below: logoView.layer)
        pulsator.start()
        pulsator.numPulse = 6
        pulsator.radius = 300
        pulsator.animationDuration = 10
        pulsator.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        pulsator.position = logoView.layer.position
    }
    
    
}
