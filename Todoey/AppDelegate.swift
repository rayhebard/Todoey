//
//  AppDelegate.swift
//  Todoey
//
//  Created by Raymond Hebard on 6/28/19.
//  Copyright © 2019 Raymond Hebard. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        do{
            _ = try Realm()
        }catch{
            print("Error initailising new realm. \(error)")
        }
        
        return true
    }

}

