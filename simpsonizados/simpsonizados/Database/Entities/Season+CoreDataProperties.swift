//
//  Season+CoreDataProperties.swift
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

extension Season {

    @NSManaged var seasonName: String?
    @NSManaged var chapters: NSSet?

}
