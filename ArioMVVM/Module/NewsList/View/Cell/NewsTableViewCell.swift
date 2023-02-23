//
//  NewsTableViewCell.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureWithCellModel(article: Article) {
        imgNews.contentMode = .scaleToFill
        
        if let imgUrl = article.urlToImage {
            imgNews.setImage(imgUrl)
        } else {
            imgNews.setImage("")
        }
        lblTitle.text = article.title ?? ""
        lblDesc.text = article.description ?? ""
        
    }
}
