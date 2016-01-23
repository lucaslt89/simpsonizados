//
//  SeasonViewController.swift
//  simpsonizados
//
//  Created by Lucas Diez de Medina on 1/16/16.
//  Copyright © 2016 technopix. All rights reserved.
//

import UIKit
import AVKit
import AlamofireImage

let ShowSeasonViewControllerSegueIdentifier = "ShowSeasonViewController"

class SeasonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var season: Int!
    var chapters: [Chapter]!

    private struct Cells {
        static let ChapterCellIdentifier : String = "ChapterCellIdentifier"
    }

    // MARK: - UIView Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        chapters = DatabaseManager.sharedInstance.retrieveChaptersOfSeason(season)
    }

    // MARK: - UITableViewDelegate and DataSource methods -

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chapters.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let selectedChapter = chapters[indexPath.row]

        let cell = tableView.dequeueReusableCellWithIdentifier(Cells.ChapterCellIdentifier) as! ChapterTableViewCell
        cell.nameLabel.text = selectedChapter.name
        cell.descriptionLabel.text = selectedChapter.chapterDescription
        if let imageUrlString = selectedChapter.imageURL {
            cell.chapterImageView.af_setImageWithURL(NSURL(string: imageUrlString)!)
        }
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let selectedChapter = chapters[indexPath.row]

        if let uniqueVersionURL = extractUniqueURLFromChapter(selectedChapter) {
            playVideoFromURL(uniqueVersionURL)
        }
        else {
            showSelectVersionAlertForChapter(selectedChapter)
        }
    }

    // MARK: - Play Video methods -

    private func showSelectVersionAlertForChapter(chapter:Chapter) {
        let alertController = UIAlertController(title: "Select a language", message: nil, preferredStyle: UIAlertControllerStyle.Alert)

        if let latinoURL = chapter.latinoURL where !latinoURL.isEmpty {
            let action = UIAlertAction(title: "Español Latino", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.playVideoFromURL(latinoURL)
            })
            alertController.addAction(action)
        }

        if let spanishURL = chapter.spanishURL where !spanishURL.isEmpty {
            let action = UIAlertAction(title: "Español", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.playVideoFromURL(spanishURL)
            })
            alertController.addAction(action)
        }

        if let englishURL = chapter.englishURL where !englishURL.isEmpty {
            let action = UIAlertAction(title: "English", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                self.playVideoFromURL(englishURL)
            })
            alertController.addAction(action)
        }

        let action = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive, handler: { (action) -> Void in
            alertController.dismissViewControllerAnimated(true, completion: nil)
        })
        alertController.addAction(action)

        presentViewController(alertController, animated: true, completion: nil)
    }

    private func extractUniqueURLFromChapter(chapter: Chapter) -> String? {
        if chapter.latinoURL != nil && chapter.spanishURL == nil && chapter.englishURL == nil {
            return chapter.latinoURL!
        }
        else if chapter.latinoURL == nil && chapter.spanishURL != nil && chapter.englishURL == nil {
            return chapter.spanishURL!
        }
        else if chapter.latinoURL == nil && chapter.spanishURL == nil && chapter.englishURL != nil {
            return chapter.englishURL!
        }
        return nil
    }

    private func playVideoFromURL(url: String) {
        let avPlayerController = AVPlayerViewController()
        avPlayerController.player = AVPlayer(URL: NSURL(string: url)!)

        avPlayerController.player?.play()

        navigationController?.pushViewController(avPlayerController, animated: true)
    }

}
