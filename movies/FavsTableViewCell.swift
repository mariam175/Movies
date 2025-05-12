//
//  FavsTableViewCell.swift
//  movies
//
//  Created by Macos on 04/05/2025.
//

import UIKit

class FavsTableViewCell: UITableViewCell {

    @IBOutlet weak var favImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var favLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
