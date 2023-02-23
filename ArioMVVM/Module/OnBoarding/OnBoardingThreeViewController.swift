//
//  OnBoardingThreeViewController.swift
//  Created by Muhammad ario bagus on 24/02/23.

import Foundation
import UIKit

class OnBoardingThreeViewController: BaseOnBoardingContentViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblTitleSub: UILabel!
    @IBOutlet weak var halamanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.pageIndex = 2
        self.lblTitle.text = "Lorem Ipsum 3"
        self.lblTitleSub.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry 3"
    }
    
    private func setupUI() {
        self.halamanButton.layer.shadowColor = UIColor.cyan.cgColor
        self.halamanButton.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.halamanButton.layer.shadowOpacity = 0.5
        self.halamanButton.layer.shadowRadius = 9.0 / 2.0
        self.halamanButton.layer.masksToBounds = false
    }
    
    @IBAction func navigateToHome(_ sender: Any) {
        UIApplication.shared.keyWindow?.rootViewController = CategoriesNewsWireframe.makeCategoriesNewsNavigationViewController()
//        PreferencesManager.shared.setFinishOnboarding(true)
    }
}
