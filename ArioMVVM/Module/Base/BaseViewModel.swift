//
//  BaseViewModel.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import RxSwift
import RxCocoa

class BaseViewModel {
    var disposeBag = DisposeBag()
    var state = BehaviorRelay<LoadingState>(value: .notLoad)
    var errorModelObservable = BehaviorRelay<ResponseError.ErrorModel?>(value: nil)
    var error: Error?
    
    var errorModel: ResponseError.ErrorModel? {
        get { return errorModelObservable.value }
        set { errorModelObservable.accept(newValue) }
    }

    func handleNetworkError(_ error: Error) {
        if let errorResponseModel = error as? ResponseError.ErrorModel {
            self.errorModel = errorResponseModel
        }
    }
    
    func handleError(_ error: Error?) {
        self.error = error
    }
}

enum LoadingState: Int {
    case notLoad
    case loading
    case finished
    case failed
}

struct ResponseError: Codable {
    let errors: [ErrorModel]?
    
    struct ErrorModel: Codable, Error {
        let title: String?
        let detail: String?
        let code: String?
        let status: Int?
    }
}
