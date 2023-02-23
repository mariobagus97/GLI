//
//  OnBoardingWireframe.swift
//  Created by Muhammad ario bagus on 24/02/23.

import Foundation
import UIKit

class OnBoardingWireframe {
    static func makeOnBoardingView() -> UINavigationController {
        if let nv = StoryboardScenes.kOnBoardingScreen.makeInstantiateViewController() as? UINavigationController {
            return nv
        }
        return UINavigationController.init()
    }
    
    static func makeOnBoardingPageController() -> UIPageViewController {
        if let pc = StoryboardScenes.kOnBoardingScreen.makeViewControllerWithIdentifier(BasePageViewController.storyBoardId()) as? UIPageViewController {
            return pc
        }
        return UIPageViewController.init()
    }
    
    static func makeOnBoardingOneView() -> UIViewController {
        if let nv = StoryboardScenes.kOnBoardingScreen.makeViewControllerWithIdentifier(OnBoardingOneViewController.storyBoardId()) {
            return nv
        }
        return UIViewController.init()
    }
    
    static func makeOnBoardingTwoView() -> UIViewController {
        if let nv = StoryboardScenes.kOnBoardingScreen.makeViewControllerWithIdentifier(OnBoardingTwoViewController.storyBoardId()) {
            return nv
        }
        return UIViewController.init()
    }
    
    static func makeOnBoardingThreeView() -> UIViewController {
        if let nv = StoryboardScenes.kOnBoardingScreen.makeViewControllerWithIdentifier(OnBoardingThreeViewController.storyBoardId()) {
            return nv
        }
        return UIViewController.init()
    }

}
