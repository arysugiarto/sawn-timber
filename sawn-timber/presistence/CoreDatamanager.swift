//
//  CoreDatamanager.swift
//  sawn-timber
//
//  Created by Ary Sugiarto on 29/08/25.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    let container: NSPersistentContainer

    private init() {
        container = NSPersistentContainer(name: "CalculatorModel") // harus sama dengan nama .xcdatamodeld kamu
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store gagal load: \(error)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }
}
