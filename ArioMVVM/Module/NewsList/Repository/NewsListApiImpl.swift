//
//  NewsListApiImpl.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import RxSwift

class NewsListApiImpl: NewsListApi {
    
    let networkService: NetworkService
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func getNewsList(sourceId: String, page: Int, pageSize: Int) -> Observable<NewsListModel?> {
        let url = ArioApi.newsList(sourceId: sourceId, page: page, pageSize: pageSize).urlString()
        
        return self.networkService.get(urlString: url).flatMap { dataResponse -> Observable<NewsListModel?> in
            do {
                let response = try JSONDecoder().decode(NewsListModel.self, from: dataResponse)
                return Observable.just(response)
            } catch let error {
                return Observable.error(error)
            }
        }
    }
    
    func getSearchArticle(valueSearch: String, source: String, page: Int, pageSize: Int) -> Observable<NewsListModel?> {
        let url = ArioApi.searchArticleNews(valueSearch: valueSearch, filterSource: source, page: page, pageSize: pageSize).urlString()
        
        return self.networkService.get(urlString: url).flatMap { dataResponse -> Observable<NewsListModel?> in
            do {
                let response = try JSONDecoder().decode(NewsListModel.self, from: dataResponse)
                return Observable.just(response)
            } catch let error {
                return Observable.error(error)
            }
        }
    }
}
