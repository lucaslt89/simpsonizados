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

        let avPlayerController = AVPlayerViewController()
        avPlayerController.player = AVPlayer(URL: NSURL(string: selectedChapter.latinoURL!)!)

        avPlayerController.player?.play()

        navigationController?.pushViewController(avPlayerController, animated: true)
    }

}