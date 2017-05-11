//
//  AppDelegate.swift
//  Madrid Shops
//
//  Created by Eric Risco de la Torre on 11/05/2017.
//  Copyright © 2017 ERISCO. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var context: NSManagedObjectContext?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let container = persistentContainer(dbName: CONSTANTS.DBNAME) { (error: NSError) in
            fatalError("Unresolved error \(error), \(error.userInfo)")
        }
        
        self.context = container.viewContext
        
        if(refresh()){
            loadingViewController() //load LoadingViewController when downloading JSON

            
            JSONInteractor().execute(urlString: CONSTANTS.SHOPS_URL,
                                     toDecode: CONSTANTS.JSON_ROOT_SHOPS,
                                     context: context!, completion: {
                setRefresh()
                self.loadViewController()
            }, onError: {
                let alert = UIAlertController(title: "Alert", message: "Some problems downloading the shops data", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                let navigationController = application.windows[0].rootViewController as! UINavigationController
                let activeViewCont = navigationController.visibleViewController
                activeViewCont?.present(alert, animated: true, completion: nil)
            })
            
        }else{
            loadViewController()
        }
        
        return true
    }
    
    func loadingViewController(){
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loadController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoadingViewController")
        
        self.window?.rootViewController = loadController
    }
    
    func loadViewController(){
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navController: UINavigationController = mainStoryboard.instantiateViewController(withIdentifier: "NavigationViewController") as! UINavigationController
        
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        self.injectContextAndFetchToFirstViewController() //Inject fetch to rootview
        
    }
    
    //Inject main fetch to root view controller
    func injectContextAndFetchToFirstViewController(){
        if let navController = window?.rootViewController as? UINavigationController,
            let initialViewController = navController.topViewController as? ShopsViewController{
            initialViewController.context = self.context
            initialViewController.fetchedResultsController = Shop.fetchController(context: context!, text: "")
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        guard let context = self.context else { return }
        saveContext(context: context, process: true)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let context = self.context else { return }
        saveContext(context: context, process: true)
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        guard let context = self.context else { return }
        saveContext(context: context, process: true)
    }


}

