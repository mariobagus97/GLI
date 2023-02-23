//
//  SourcesNewsWireframe.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import UIKit

class SourcesNewsWireframe {
    static func makeCategoriesNewsViewController(category: String) -> UIViewController {
        let vc = SourcesNewsViewController.loadFromNib()
        vc.category = category
        return vc
    }
}
