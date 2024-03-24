//
//  PremiumVersionPurchased+CoreDataProperties.swift
//  
//
//  Created by Chaudhry Mustafa Jawad on 24/03/2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension PremiumVersionPurchased {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PremiumVersionPurchased> {
        return NSFetchRequest<PremiumVersionPurchased>(entityName: "PremiumVersionPurchased")
    }

    @NSManaged public var isPremium: Bool

}

extension PremiumVersionPurchased : Identifiable {

}
