//
//  CategoriesNewsViewController.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 23/02/23.
//

import UIKit

enum Category: String {
    case Business
    case Entertainment
    case General
    case Health
    case Science
    case Sports
    case Technology
}

class CategoriesNewsViewController: BaseViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func didBtnTapped(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle {
            print(buttonTitle)
            self.navigationController?.pushViewController(SourcesNewsWireframe.makeCategoriesNewsViewController(category: buttonTitle), animated: true)
        }
    }
}
