//
//  CoreDataManager.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context: NSManagedObjectContext?
    
    init() {
        let persistentContainer = appDelegate.persistentContainer
        context = persistentContainer.viewContext
    }
}


