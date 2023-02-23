//
//  LoadingTableViewCell.swift
//  Created by Muhammad ario bagus on 24/02/23.

import UIKit

class LoadingTableViewCell: UITableViewCell, ReusableCell {
    
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
