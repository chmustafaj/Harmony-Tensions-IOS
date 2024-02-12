//
//  Song+CoreDataProperties.swift
//  
//
//  Created by Chaudhry Mustafa Jawad on 09/02/2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var diminished: Int32
    @NSManaged public var gotoDiminished: Int32
    @NSManaged public var key: String?
    @NSManaged public var level: Int32
    @NSManaged public var name: String?
    @NSManaged public var progression: String?
    @NSManaged public var secondaryDominant: Int32
    @NSManaged public var turnaround: Int32

}

extension Song : Identifiable {

}
