//
//  AppDelegate.swift
//  CoreData
//
//  Created by Laura Arranz on 05/02/2019.
//  Copyright © 2019 Laura Arranz. All rights reserved.
//

/*
 *
 *
Sistema de persistencia que permite tener modelos de datos complejos.
La información la almacena en un fichero (SQLite)
Permite crear relaciones complejas, como si fuera una BBDD de alto nivel.
Y crear relaciones bidireccionales (que una entidad apunte a otra y tener la realción inversa)
Se pueden hacer búsquedas con lenguaje pseudoSQL.
Se puede usar como un sistema de caché local.
 *
 *
 */

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = self.window?.rootViewController as! ViewController
        vc.context = self.persistentContainer.viewContext
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

