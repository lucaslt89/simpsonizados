//
//  ChapterTableViewCell.swift
//  simpsonizados
//
//  Created by Lucas Diez de Medina on 1/19/16.
//  Copyright © 2016 technopix. All rights reserved.
//

import UIKit

class ChapterTableViewCell: UITableViewCell {

    @IBOutlet weak var chapterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        chapterImageView.image = nil
        nameLabel.text = nil
        descriptionLabel.text = nil
    }

}
