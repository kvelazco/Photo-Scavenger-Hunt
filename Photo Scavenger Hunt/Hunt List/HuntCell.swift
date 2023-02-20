//
//  HuntCell.swift
//  Photo Scavenger Hunt
//
//  Created by Kevin Velazco on 2/19/23.
//

import UIKit

class HuntCell: UITableViewCell {
    
    @IBOutlet weak var completedImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with hunt: Hunt) {
        titleLabel.text = hunt.title
        titleLabel.textColor = hunt.isComplete ? .secondaryLabel : .label
        completedImageView.image = UIImage(systemName: hunt.isComplete ? "circle.inset.filled" : "circle")?.withRenderingMode(.alwaysTemplate)
        completedImageView.tintColor = hunt.isComplete ? .systemOrange : .tertiaryLabel
    }

}
