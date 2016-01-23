//
//  HTMLParser.swift
//  simpsonizados
//
//  Created by Lucas Diez de Medina on 1/21/16.
//  Copyright © 2016 technopix. All rights reserved.
//

import UIKit
import Kanna

class HTMLParser: NSObject {

    class func parseURLFromSimpsonizadosSeasonPage(url: NSURL) {

        do {
            let myHTMLString = try String(contentsOfURL: url, encoding: NSUTF8StringEncoding)
            if let doc = Kanna.HTML(html: myHTMLString, encoding: NSUTF8StringEncoding) {

                var season = url.absoluteString.characters.split("-").map(String.init)[2]
                season = season.characters.split(".").map(String.init)[0]

                // Search for Chapter titles
                var chapterTitles = Array<String>()
                for chapter in doc.css("h3") {
                    let partsArray = chapter.text!.characters.split("\"").map(String.init)
                    chapterTitles.append(partsArray[1])
                }

                //Search for descriptions
                var chapterDescriptions = Array<String>()
                for description in doc.css("p[class~=\"desc\"]") {
                    chapterDescriptions.append(description.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
                }

                //Search for image urls
                var imagesURLs = Array<String>()
                for smallImageURL in doc.css("img[src^=\"https://www.simpsonizados.org/api/\"]") {
                    var bigImageURL : String = smallImageURL["src"]!
                    bigImageURL = bigImageURL.stringByReplacingOccurrencesOfString("https://www.simpsonizados.org/api/imagen.php?src=", withString: "")
                    bigImageURL = bigImageURL.stringByReplacingOccurrencesOfString("150&h=85", withString: "200&h=110")
                    imagesURLs.append(bigImageURL)
                }

                for chapterIndex in 0..<chapterTitles.count {
                    print(season + "|" + chapterTitles[chapterIndex] + "|" + chapterDescriptions[chapterIndex] + "|_____________________|||" + imagesURLs[chapterIndex])
                }

            }
        } catch _ {

        }
    }

}
