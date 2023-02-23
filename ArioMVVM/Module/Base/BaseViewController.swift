//
//  BaseViewController.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        let navigationBar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.shadowColor = .white
        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
    }
}
