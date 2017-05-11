//
//  SongTableViewCell.swift
//  Utility Application
//
//  Created by USER on 10/5/17.
//  Copyright © 2017 214126186. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    //variables for elements in individual table cells
    @IBOutlet weak var coverImagePicture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
