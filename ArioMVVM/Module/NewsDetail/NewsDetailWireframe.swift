//
//  NewsDetailWireframe.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import UIKit

class NewsDetailWireframe {
    static func makeNewsDetailViewController(article: Article?) -> UIViewController {
        let vc = NewsDetailViewController.loadFromNib()
        vc.article = article
        return vc
    }
}
