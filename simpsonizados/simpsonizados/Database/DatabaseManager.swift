//
//  DatabaseManager.swift
//  simpsonizados
//
//  Created by Lucas Diez de Medina on 1/19/16.
//  Copyright © 2016 technopix. All rights reserved.
//

import UIKit
import CoreData

class DatabaseManager: NSObject {

    // MARK: - Singleton -

    // MARK: Singleton

    class var sharedInstance : DatabaseManager {
        struct Static {
            static var instance: DatabaseManager?
            static var token: dispatch_once_t = 0
        }

        dispatch_once(&Static.token) {
            Static.instance = DatabaseManager()
        }

        return Static.instance!
    }

    // MARK: - Seasons management methods -

    func insertUpdateSeasonWithNumber(season: Int) -> Season {

        let seasonName = "Season " + "\(season)"
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        //Try to load existing season

        let fetchRequest = NSFetchRequest(entityName: "Season")
        fetchRequest.predicate = NSPredicate(format: "seasonName = %@", seasonName)

        var existingSeason : Season? = nil
        do {
            existingSeason = try managedContext.executeFetchRequest(fetchRequest).first as? Season
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        if existingSeason == nil {
            let entity = NSEntityDescription.entityForName("Season", inManagedObjectContext:managedContext)

            existingSeason = Season(entity: entity!,
                insertIntoManagedObjectContext: managedContext)
        }

        existingSeason!.seasonName = seasonName
        (existingSeason?.valueForKey("chapters") as! NSMutableSet).removeAllObjects()

        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

        return existingSeason!

    }

    func retrieveSeasons() -> [Season]! {

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        let fetchRequest = NSFetchRequest(entityName: "Season")

        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            return results as! [Season]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        return [];
    }

    // MARK: - Chapters management methods -

    func insertUpdateChapterOfSeason(season: Int,
        name: String,
        chapterDescription: String,
        imageURL: String,
        latinoURL: String,
        spanishURL: String,
        englishURL: String)
    {
        let seasonName = "Season " + "\(season)"

        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        //----------------------------------------------------------------
        //Try to load existing Chapter or create one if it doesn't exist.

        let fetchRequest = NSFetchRequest(entityName: "Chapter")
        fetchRequest.predicate = NSPredicate(format: "season.seasonName = %@ AND name = %@", seasonName, name)

        var existingChapter : Chapter? = nil
        do {
            existingChapter = try managedContext.executeFetchRequest(fetchRequest).first as? Chapter
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        if existingChapter == nil {
            let entity = NSEntityDescription.entityForName("Chapter", inManagedObjectContext:managedContext)

            existingChapter = Chapter(entity: entity!,
                insertIntoManagedObjectContext: managedContext)
        }

        //----------------------------------------------------------------

        existingChapter!.name = name
        existingChapter!.chapterDescription = chapterDescription
        existingChapter!.imageURL = imageURL
        existingChapter!.latinoURL = latinoURL
        existingChapter!.spanishURL = spanishURL
        existingChapter!.englishURL = englishURL

        //----------------------------------------------------------------
        //Load Season.

        let seasonFetchRequest = NSFetchRequest(entityName: "Season")
        seasonFetchRequest.predicate = NSPredicate(format: "seasonName = %@", seasonName)

        var existingSeason : Season? = nil
        do {
            existingSeason = try managedContext.executeFetchRequest(seasonFetchRequest).first as? Season
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }

        if existingSeason == nil {
            existingSeason = insertUpdateSeasonWithNumber(season)
        }

        //----------------------------------------------------------------

        (existingSeason?.valueForKey("chapters") as! NSMutableSet).addObject(existingChapter!)
        existingChapter!.season = existingSeason

        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }

    }

    func retrieveChaptersOfSeason(season: Int) -> [Chapter]! {

        let seasonName = "Season " + "\(season)"
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext

        let fetchRequest = NSFetchRequest(entityName: "Chapter")
        fetchRequest.predicate = NSPredicate(format: "season.seasonName = %@", seasonName)

        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            return results as! [Chapter]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return [];
    }

    func extractChaptersFromCSVFile(fileLocation: String) {

        let error: NSErrorPointer = nil
        if let csv = CSV(contentsOfFile: fileLocation, error: error) {
            var rowIndex = 1;
            for row in csv.rows {
                insertUpdateChapterOfSeason(Int(row["Season"]!)!,
                    name: row["Name"]!,
                    chapterDescription: row["Description"]!,
                    imageURL: row["ImageURL"]!,
                    latinoURL: row["LatinoURL"]!,
                    spanishURL: row["SpanishURL"]!,
                    englishURL: row["EnglishURL"]!)
                rowIndex++;
            }
        }
    }

}
