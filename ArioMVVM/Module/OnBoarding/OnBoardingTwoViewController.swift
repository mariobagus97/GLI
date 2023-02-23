//
//  OnBoardingTwoViewController.swift
//  Created by Muhammad ario bagus on 24/02/23.

import Foundation
import UIKit

class OnBoardingTwoViewController: BaseOnBoardingContentViewController {
    @IBOutlet private weak var bottomButton: UIButton!

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTitlesub: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageIndex = 1
        self.lblTitle.text = "Lorem Ipsum 2"
        self.lblTitlesub.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry 2"
    }

    @IBAction private func bottomButtonTapped(_ sender: UIButton) {
        UIApplication.shared.keyWindow?.rootViewController = CategoriesNewsWireframe.makeCategoriesNewsNavigationViewController()
//        PreferencesManager.shared.setFinishOnboarding(true)
    }

}
