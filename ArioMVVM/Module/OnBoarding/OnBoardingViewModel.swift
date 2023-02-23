//
//  OnBoardingViewModel.swift
//  Created by Muhammad ario bagus on 24/02/23.

import Foundation

class OnBoardingViewModel {
    private let userDefault: UserDefaults
    private let hasPresenteKey: String = "hasPresentKey"
    
    init(userDefault: UserDefaults = UserDefaults.standard) {
        self.userDefault = userDefault
    }
    
    func setOnBoardingViewCache(hasPresent: Bool) {
        userDefault.set(hasPresent, forKey: hasPresenteKey)
        userDefault.synchronize()
    }
    
    func getOnBoardingViewCache() -> Bool {
        return userDefault.bool(forKey: hasPresenteKey)
    }
}
