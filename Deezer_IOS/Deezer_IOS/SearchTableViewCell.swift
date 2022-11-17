//
//  SearchTableViewCell.swift
//  Deezer_IOS
//
//  Created by admin on 17/11/2022.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet var NameArtist : UILabel!
    @IBOutlet var ImageArtist : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
