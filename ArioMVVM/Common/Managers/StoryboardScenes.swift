//
//  StoryboardScenes.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import UIKit

enum StoryboardScenes: String {
    case kSplashScreen              = "Splash"
    case kOnBoardingScreen          = "OnBoarding"
    case kLaunchScreen              = "Launch"
}

extension StoryboardScenes {
    func makeInstantiateViewController() -> UIViewController? {
        return storyboardWithName(self.rawValue).instantiateInitialViewController()
    }
    
    func makeViewControllerWithIdentifier(_ identifier: String) -> UIViewController? {
        return storyboardWithName(self.rawValue).instantiateViewController(withIdentifier: identifier)
    }
    
    func storyboardWithName(_ name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}
