//
//  NewsListWireframe.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import UIKit

class NewsListWireframe {
    static func makeNewsListViewController(sourceId: String) -> UIViewController {
        let vc = NewsListViewController.loadFromNib()
        vc.sourceId = sourceId
        return vc
    }
    
    static func makeNewsListNavigationViewController() -> UINavigationController {
        let vc = NewsListViewController.loadFromNib()
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }
}
