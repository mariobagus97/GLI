//
//  OnBoardingOneViewController.swift
//  Created by Muhammad ario bagus on 24/02/23.

import Foundation
import UIKit

class OnBoardingOneViewController: BaseOnBoardingContentViewController {
    @IBOutlet private weak var skipButton: UIButton!
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTitle2: UILabel!
    @IBOutlet weak var lblTitlesub: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageIndex = 0
        self.lblTitle.text = "Lorem Ipsum"
        self.lblTitlesub.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        
    }
    
    @IBAction private func skipButtonTapped(_ sender: UIButton) {
        UIApplication.shared.keyWindow?.rootViewController = CategoriesNewsWireframe.makeCategoriesNewsNavigationViewController()
//        PreferencesManager.shared.setFinishOnboarding(true)
    }
    
}
