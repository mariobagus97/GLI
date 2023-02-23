//
//  NewsDetailViewController.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class NewsDetailViewController: BaseViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblSourceName: UILabel!
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        if let article = self.article {
            imgBanner.contentMode = .scaleToFill
            lblTitle.text = article.title ?? ""
            lblDesc.text = article.description ?? ""
            lblSourceName.text = article.source?.name ?? "-"
            imgBanner.setImage(article.urlToImage)
            
            if let date = article.publishedAt, let formatDate = SQDateFormatter.yyyy_dash_MM_dash_dd_T_HH_colon_mm_colon_ssZZZZ.dateFromString(date) {
                lblDate.text = SQDateFormatter.dd_MMMM_yyyy.stringFromDate(formatDate)
            } else {
                lblDate.text = "-"
            }
        }
    }
}
