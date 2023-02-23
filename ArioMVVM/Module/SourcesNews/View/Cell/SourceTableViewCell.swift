//
//  SourceTableViewCell.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import UIKit

class SourceTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblURL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(source: Source?) {
        if let source = source {
            lblName.text = source.name ?? "-"
            lblDesc.text = source.description ?? "-"
            lblURL.text = source.url ?? "-"
        }
    }
}
