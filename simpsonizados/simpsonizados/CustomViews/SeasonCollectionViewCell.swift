//
//  SeasonCollectionViewCell.swift
//  simpsonizados
//
//  Created by Lucas Diez de Medina on 1/19/16.
//  Copyright © 2016 technopix. All rights reserved.
//

import UIKit

let SeasonCollectionViewCellIdentifier = "SeasonCellIdentifier"

class SeasonCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var seasonImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10;
        clipsToBounds = true
    }

}
