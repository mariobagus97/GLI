//
//   SourcesNewsViewModel.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import RxSwift

class SourcesNewsViewModel: BaseViewModel {
    
    let sourcesNewsApi: SourcesNewsApi
    init(sourcesNewsApi: SourcesNewsApi) {
        self.sourcesNewsApi = sourcesNewsApi
    }
    
    // MARK: Data
    var dataSource: [Source]?
    
    func getSourceList(category: String) {
        self.state.accept(.loading)
        
        return self.sourcesNewsApi.getSourcesList(category: category)
            .catch({ [weak self] error -> Observable<SourcesListModel?> in
                guard let weakSelf = self else { return Observable.just(nil) }
                weakSelf.handleNetworkError(error)
                weakSelf.state.accept(.failed)
                return Observable.just(nil)
            })
                .subscribe(onNext: { [weak self] responseModel in
                    guard let weakSelf = self else { return }
                    if let validResponseModel = responseModel, let sourceList = validResponseModel.sources {
                        weakSelf.dataSource = sourceList
                        weakSelf.state.accept(.finished)
                    } else {
                        weakSelf.state.accept(.failed)
                    }
                }).disposed(by: disposeBag)
    }
}
