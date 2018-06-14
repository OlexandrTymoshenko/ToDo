//
//  ImageLabelTableViewCell.swift
//  ToDo
//
//  Created by Oleksandr Tymoshenko on 6/4/18.
//  Copyright © 2018 Oleksandr Tymoshenko. All rights reserved.
//

import UIKit

class ImageLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
