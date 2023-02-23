//
//  UIViewControllerExtension.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func storyBoardId() -> String {
        return String(describing: self)
    }
    
    var isModal: Bool {
        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController
        
        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }

    func redirectTo(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func setArrowBack(_ icon: UIImage) {
        let btn1 = UIButton(type: .custom)
        btn1.setImage(icon, for: .normal)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(self.popView(_:)), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.leftBarButtonItem = item1
        self.navigationItem.leftBarButtonItem?.tintColor = .red
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    @objc func popView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    /// Call this once to dismiss open keyboards by tapping anywhere in the view controller
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }

    /// Dismisses the keyboard from self.view
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
    
    /*
     The name of the nib file needs to be the same as the name of the class
     */
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
    
    func dismissAllViewControllers() {
        var currentViewController: UIViewController? = self
        while(currentViewController?.presentingViewController != nil) {
            currentViewController = currentViewController?.presentingViewController
            currentViewController?.navigationController?.popToRootViewController(animated: false)
        }
        currentViewController?.dismiss(animated: false, completion: nil)
    }
    
    //MARK: - setupPhoneNumberFormat
    func formatPhoneNumber(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator

        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])

                // move numbers iterator to the next index
                index = numbers.index(after: index)
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
}
