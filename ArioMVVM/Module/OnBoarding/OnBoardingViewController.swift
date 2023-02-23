//
//  OnBoardingViewController.swift
//  Created by Muhammad ario bagus on 24/02/23.

import Foundation
import UIKit

class OnBoardingViewController: BaseViewController {
    
    @IBOutlet weak var viewPageControl: UIView!
    @IBOutlet var pageControl: UIPageControl!
    
    var pageViewController: UIPageViewController?
    let viewControllers: [UIViewController] = [OnBoardingWireframe.makeOnBoardingOneView(),
                                               OnBoardingWireframe.makeOnBoardingTwoView(),
                                               OnBoardingWireframe.makeOnBoardingThreeView()]
    var pendingPageIndex = 0
    
    let viewModel = OnBoardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        
    }
    
    override func viewDidLayoutSubviews() {
        pageControl.subviews.forEach {
            $0.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    func setupUI() {
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = #colorLiteral(red: 0.8392156863, green: 0.9450980392, blue: 0.9568627451, alpha: 1)
        self.pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.8392156863, green: 0.9450980392, blue: 0.9568627451, alpha: 1)
        self.pageControl.currentPageIndicatorTintColor = UIColor.cyan
        if #available(iOS 14.0, *) {
            self.pageControl.backgroundStyle = .minimal
            self.pageControl.allowsContinuousInteraction = false
        }
        self.viewPageControl.layer.cornerRadius = 12
        self.viewPageControl.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9764705882, blue: 0.9803921569, alpha: 1)
        
        pageViewController = BasePageViewController()
        if let validPageViewController = self.pageViewController {
            validPageViewController.delegate = self
            validPageViewController.dataSource = self
            validPageViewController.setViewControllers([self.viewControllers[0]], direction: .forward, animated: true, completion: nil)
            
            addChild(validPageViewController)
            view.addSubview(validPageViewController.view)
            validPageViewController.didMove(toParent: self)
        }
        self.view.bringSubviewToFront(viewPageControl)
    }
    
    private func bindViewModel() {
        // TODO: - move to AppDelegate
        if !viewModel.getOnBoardingViewCache() {
            viewModel.setOnBoardingViewCache(hasPresent: true)
        } else {
            gotoMainTabbar()
        }
    }
    
    private func gotoMainTabbar() {
        self.dismiss(animated: false, completion: nil)
        UIApplication.shared.keyWindow?.rootViewController = CategoriesNewsWireframe.makeCategoriesNewsNavigationViewController()
    }
}

extension OnBoardingViewController: UIPageViewControllerDelegate {
    
    /** Will transition, so keep the page where it goes */
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        if pendingViewControllers.count > 0, let vc = pendingViewControllers[0] as? BaseOnBoardingContentViewController {
            pendingPageIndex = vc.pageIndex
        }
    }
    
    /** Did finish the transition, so set the page where was going */
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let vc = previousViewControllers.first, let baseVc = vc as? BaseOnBoardingContentViewController {
            if completed {
                pageControl.currentPage = pendingPageIndex
            }
        }
    }
}

extension OnBoardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? { //return nil if viewController is first
        if let vc = viewController as? BaseOnBoardingContentViewController {
            if (vc.pageIndex == NSNotFound || vc.pageIndex == 0) {
                return nil
            } else {
                return self.viewControllers[vc.pageIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? { //return nil if viewController is last
        if let vc = viewController as? BaseOnBoardingContentViewController {
            if (vc.pageIndex == NSNotFound || vc.pageIndex == 2) {
                return nil
            } else {
                return self.viewControllers[vc.pageIndex + 1]
            }
        }
        return nil
    }
    
}
