//
//  Persistence.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = CartProduct(context: viewContext)
            newItem.name = String()
        }
        do {
            try viewContext.save()
        } catch {
            //  Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "EasyBuyApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
//import CoreData
//import SwiftUI
//
//class CoreDataManager {
//    static let shared = CoreDataManager()
//    
//    let persistentContainer: NSPersistentContainer
//    
//    init() {
//        persistentContainer = NSPersistentContainer(name: "CartProduct") // Use your Core Data model name
//        persistentContainer.loadPersistentStores { description, error in
//            if let error = error {
//                fatalError("Unable to load persistent stores: \(error)")
//            }
//        }
//    }
//    
//    func saveContext() {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//
//    func saveProduct(_ product: CartProduct) {
//        let context = persistentContainer.viewContext
//        let cartProduct = CartProduct(context: context)
//        cartProduct.id = product.id
//        cartProduct.name = product.name
//        cartProduct.price = product.price
//        cartProduct.imageName = product.imageName
//        saveContext()
//    }
//    
//    func fetchCartProducts() -> [CartProduct] {
//        let context = persistentContainer.viewContext
//        let fetchRequest: NSFetchRequest<CartProduct> = CartProduct.fetchRequest()
//        do {
//            return try context.fetch(fetchRequest)
//        } catch {
//            print("Error fetching products: \(error)")
//            return []
//        }
//    }
//
//    func deleteProduct(_ product: CartProduct) {
//        let context = persistentContainer.viewContext
//        context.delete(product)  
//        saveContext()
//    }
//}
