//
//  DaysManager.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit
import CoreData

class DaysManager: CoreDataManager {
    
    static let shared = DaysManager()
    let entity = "Days"
    
    func storeAll(of days: [Day], in cityId: Int) {
        DaysManager.shared.delete(of: cityId)
        
        for day in days {
            store(of: day, in: cityId)
        }
    }
    
    func store(of day: Day, in cityId: Int) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.predicate = NSPredicate(format: "dt == %@ AND cityId == %@", "\(day.dt)", "\(cityId)")
        do {
            let fetchResults = try context?.fetch(request)
            var managedObject: Days
            
            if fetchResults?.isEmpty ?? true {
                managedObject = NSEntityDescription.insertNewObject(forEntityName: entity, into: context!) as! Days
                managedObject.dt = Int64(day.dt)
            } else {
                managedObject = fetchResults!.first as! Days
            }
            
            managedObject.dtTxt = day.dtTxt
            managedObject.main = day.weather.first?.main
            managedObject.icon = day.weather.first?.icon
            managedObject.cityId = Int64(cityId)
            try context?.save()
        } catch _ {
        }
    }
    
    func retrieve(of cityId: Int) -> [Day] {
        let request = NSFetchRequest<Days>(entityName: entity)
        request.predicate = NSPredicate(format: "cityId == %@", "\(cityId)")
        do {
            let result = try context?.fetch(request)
            guard let data = result, !data.isEmpty else {
                return []
            }
            return map(data)
        } catch _ {
            return []
        }
    }
    
    func delete(of cityId: Int) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.predicate = NSPredicate(format: "cityId == %@", "\(cityId)")
        _ = NSBatchDeleteRequest(fetchRequest: request)
    }
    
    private func map(_ entities: [Days]) -> [Day] {
        return entities.map { model -> Day in
            return Day(model)
        }
    }
}


