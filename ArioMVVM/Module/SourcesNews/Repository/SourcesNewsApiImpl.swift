//
//  SourcesNewsApiImpl.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import RxSwift

class SourcesNewsApiImpl: SourcesNewsApi {
    
    let networkService: NetworkService
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getSourcesList(category: String) -> Observable<SourcesListModel?> {
        let url = ArioApi.sourceList(category: category).urlString()
        
        return self.networkService.get(urlString: url).flatMap { dataResponse -> Observable<SourcesListModel?> in
            do {
                let response = try JSONDecoder().decode(SourcesListModel.self, from: dataResponse)
                return Observable.just(response)
            } catch let error {
                return Observable.error(error)
            }
        }
    }
}
