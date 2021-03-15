//
//  CitiesManager.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit
import CoreData

class CitiesManager: CoreDataManager {
    
    static let shared = CitiesManager()
    let entity = "Cities"
    
    func store(of city: City) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.predicate = NSPredicate(format: "id == %@", "\(city.id)")
        do {
            let result = try context?.fetch(request)
            var managedObject: Cities
            
            if result?.isEmpty ?? true {
                managedObject = NSEntityDescription.insertNewObject(forEntityName: entity, into: context!) as! Cities
                managedObject.id = Int64(city.id)
            }  else {
                managedObject = result!.first as! Cities
            }
            
            managedObject.name = city.name
            try context?.save()
        } catch _ {
        }
    }
    
    func retrieve(of cityName: String) -> [City] {
        let request = NSFetchRequest<Cities>(entityName: entity)
        request.predicate = NSPredicate(format: "name == %@", cityName)
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
    
    func deleteAll() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        _ = NSBatchDeleteRequest(fetchRequest: request)
    }
    
    private func map(_ entities: [Cities]) -> [City] {
        return entities.map { model -> City in
            return City(model)
        }
    }
}

