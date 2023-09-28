//
//  DataManager.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 28/03/2023.
//

import CoreData
import Foundation


@objc @objcMembers class DataManager: NSObject {
    static let shared = DataManager()
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "HarmonyTensions")
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
        return container
    }()

    // MARK: - Core Data Saving support
    func savePremiumStatus(isPremium: Bool) {
            let context = persistentContainer.viewContext

            if let entity = NSEntityDescription.entity(forEntityName: "PremiumVersionPurchased", in: context),
               let newObject = NSManagedObject(entity: entity, insertInto: context) as? PremiumVersionPurchased {
                newObject.isPremium = isPremium

                do {
                    try context.save()
                } catch {
                    print("Failed to save context: \(error)")
                }
            }
        }
    func getPremiumStatus() -> Bool {
            let context = persistentContainer.viewContext

            let fetchRequest: NSFetchRequest<PremiumVersionPurchased> = PremiumVersionPurchased.fetchRequest()

            do {
                let result = try context.fetch(fetchRequest)
                if let firstObject = result.first {
                    return firstObject.isPremium
                }
            } catch {
                print("Failed to fetch premium status: \(error)")
            }

            return false // Default value if status is not found or an error occurs
        }
    func song(name: String, progression: String, diminished:Int, gotoDiminished: Int, key:String, level: Int, secondaryDominant: Int, turnaround: Int) -> Song {
        let s = Song(context: persistentContainer.viewContext)
        s.name = name
        s.progression=progression
        s.diminished = Int32(diminished)
        s.gotoDiminished = Int32(diminished)
        s.key = key
        s.level = Int32(level)
        s.secondaryDominant = Int32(secondaryDominant)
        s.turnaround = Int32(turnaround)
        return s
    }
    func getSongs()->[Song]{
        let request:NSFetchRequest<Song> = Song.fetchRequest()
        var fetchedSongs : [Song] = []
        do{
            fetchedSongs = try persistentContainer.viewContext.fetch(request)
        }catch{
            NSLog("Error fetching budgets")
        }
        return fetchedSongs
    }

    func save () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func delete (song : Song) {
        let context = persistentContainer.viewContext
            context.delete(song)
            save()
            }

    
   
}
