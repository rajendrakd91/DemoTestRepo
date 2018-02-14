
//
//  AppDelegate.swift
//  Allok8
//
//  Created by Test User 1 on 09/10/17.
//  Copyright © 2017 Capgemini. All rights reserved.
//

import UIKit
import CoreData
import Firebase

//Appdelegate instance
var APP_DEL = UIApplication.shared.delegate as! AppDelegate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      sleep(UInt32(3.0))
        FirebaseApp.configure()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
       // self.saveContext()
    }

    // MARK: - Core Data stack

//    lazy var persistentContainer: NSPersistentContainer = {
//        /*
//         The persistent container for the application. This implementation
//         creates and returns a container, having loaded the store for the
//         application to it. This property is optional since there are legitimate
//         error conditions that could cause the creation of the store to fail.
//        */
//        let container = NSPersistentContainer(name: "Allok8")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                 
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
    // MARK:- Activity indicator
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var meassagelabel:UILabel = UILabel()
    
    func showActivityIndicator(sMessage:String ,onView:UIView)
    {
        DispatchQueue.main.async {
            self.container.frame = onView.frame
            print(onView.frame)
            self.container.center = onView.center
            self.container.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3829741379)
            self.container.isHidden = false
            self.loadingView.frame = CGRect(x: (onView.frame.size.width-150)/2, y: (onView.frame.size.height-150)/2-50, width: 150, height: 150)
            // self.loadingView.center =  self.container.center
            print(self.loadingView.center)
            self.loadingView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3)
            self.loadingView.clipsToBounds = true
            self.loadingView.layer.cornerRadius = 10
            
            self.activityIndicator.frame = CGRect(x: 0.0,y:  10.0,width : 40.0, height : 40.0);
            self.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
            self.activityIndicator.center = CGPoint(x: self.loadingView.frame.size.width / 2, y: self.loadingView.frame.size.height / 2)
            
            self.meassagelabel.frame = CGRect(x: 0.0,y : 100.0,width : 150.0,height : 45.0)
            self.meassagelabel.text = sMessage
            self.meassagelabel.textAlignment = .center
            self.meassagelabel.textColor = UIColor.white
            self.meassagelabel.backgroundColor = UIColor.clear
            self.loadingView.addSubview(self.meassagelabel)
            self.loadingView.addSubview(self.activityIndicator)
            self.container.addSubview(self.loadingView)
//            onView.addSubview(self.container)
            APP_DEL.window?.addSubview(self.container)
            self.activityIndicator.startAnimating()
            print(self.loadingView.frame)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.container.isHidden = true
        }
    }
}

