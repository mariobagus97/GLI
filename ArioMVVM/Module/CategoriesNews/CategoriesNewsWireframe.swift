//
//  CategoriesNewsWireframe.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 23/02/23.
//

import Foundation
import UIKit

class CategoriesNewsWireframe {
    static func makeCategoriesNewsViewController() -> UIViewController {
        let vc = CategoriesNewsViewController.loadFromNib()
        return vc
    }
    
    static func makeCategoriesNewsNavigationViewController() -> UINavigationController {
        let vc = CategoriesNewsViewController.loadFromNib()
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }
}
