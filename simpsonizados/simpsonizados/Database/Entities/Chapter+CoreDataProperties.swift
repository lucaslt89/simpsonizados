//
//  Chapter+CoreDataProperties.swift
//  simpsonizados
//
//  Created by Lucas Diez de Medina on 1/19/16.
//  Copyright © 2016 technopix. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Chapter {

    @NSManaged var chapterDescription: String?
    @NSManaged var imageURL: String?
    @NSManaged var latinoURL: String?
    @NSManaged var name: String?
    @NSManaged var spanishURL: String?
    @NSManaged var englishURL: String?
    @NSManaged var season: Season?

}
