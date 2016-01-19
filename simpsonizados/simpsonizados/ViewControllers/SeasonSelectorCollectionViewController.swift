//
//  SeasonSelectorCollectionViewController.swift
//  simpsonizados
//
//  Created by Lucas Diez de Medina on 1/26/16.
//  Copyright © 2016 technopix. All rights reserved.
//

import UIKit

class SeasonSelectorCollectionViewController: UICollectionViewController {

    private var selectedSeason : Int!
    private var seasons: [Season]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSeasons()
    }

    private func loadSeasons() {
        let fileLocation = NSBundle.mainBundle().pathForResource("Chapters", ofType: "csv")!
        DatabaseManager.sharedInstance.extractChaptersFromCSVFile(fileLocation)

        seasons = DatabaseManager.sharedInstance.retrieveSeasons()
    }

    // MARK: - UICollectionViewDataSource -

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seasons.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(SeasonCollectionViewCellIdentifier, forIndexPath: indexPath) as! SeasonCollectionViewCell

        let seasonNumber = indexPath.row + 1
        cell.seasonImage.image = UIImage(named: "season" + "\(seasonNumber)")
        cell.seasonLabel.text = seasons[indexPath.row].seasonName

        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        selectedSeason = indexPath.row + 1
        performSegueWithIdentifier(ShowSeasonViewControllerSegueIdentifier, sender: nil)
    }

    override func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    // MARK: - Navigation methods -

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destinationVC = segue.destinationViewController as! SeasonViewController
        destinationVC.season = selectedSeason
        destinationVC.title = "Season " + "\(selectedSeason)"
    }

}
