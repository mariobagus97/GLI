//
//  NewsListViewModel.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation
import RxCocoa
import RxSwift

class NewsListViewModel: BaseViewModel {
    
    let newsListApi: NewsListApi
    init(newsListApi: NewsListApi) {
        self.newsListApi = newsListApi
    }
    
    // MARK: Data
    var newsModel: NewsListModel?
    var dataSource: [Article]?
    
    // MARK: Pagination
    var page = 0
    let pageSize = 6
    var totalResults: Int?
    
    
    func getNews(isLoadMore: Bool = true, sourceId: String) {
        if isLoadMore {
            page = page + 1
        }
        self.state.accept(.loading)
        
        return self.newsListApi.getNewsList(sourceId: sourceId, page: page, pageSize: pageSize)
            .catch({ [weak self] error -> Observable<NewsListModel?> in
                guard let weakSelf = self else { return Observable.just(nil) }
                weakSelf.handleNetworkError(error)
                weakSelf.state.accept(.failed)
                return Observable.just(nil)
            })
            .subscribe(onNext: { [weak self] responseModel in
                guard let weakSelf = self else { return }
                if let validResponseModel = responseModel {
                    if let articleList = weakSelf.dataSource {
                        if let arrArticle = validResponseModel.articles, !arrArticle.isEmpty {
                            for article in arrArticle {
                                weakSelf.dataSource?.append(article)
                            }
                        }
                    } else {
                        weakSelf.dataSource = validResponseModel.articles
                    }
                    weakSelf.totalResults = validResponseModel.totalResults
                    weakSelf.state.accept(.finished)
                } else {
                    weakSelf.state.accept(.failed)
                }
            }).disposed(by: disposeBag)
    }
    
    func getSearchArticle(isLoadMore: Bool = true, sourceId: String, value: String) {

        if isLoadMore {
            page = page + 1
        }
        self.state.accept(.loading)
        
        return self.newsListApi.getSearchArticle(valueSearch: value, source: sourceId, page: page, pageSize: pageSize)
            .catch({ [weak self] error -> Observable<NewsListModel?> in
                guard let weakSelf = self else { return Observable.just(nil) }
                weakSelf.handleNetworkError(error)
                weakSelf.state.accept(.failed)
                return Observable.just(nil)
            })
            .subscribe(onNext: { [weak self] responseModel in
                guard let weakSelf = self else { return }
                if let validResponseModel = responseModel {
                    if let articleList = weakSelf.dataSource {
                        if let arrArticle = validResponseModel.articles, !arrArticle.isEmpty {
                            for article in arrArticle {
                                weakSelf.dataSource?.append(article)
                            }
                        }
                    } else {
                        weakSelf.dataSource = validResponseModel.articles
                    }
                    weakSelf.totalResults = validResponseModel.totalResults
                    weakSelf.state.accept(.finished)
                } else {
                    weakSelf.state.accept(.failed)
                }
            }).disposed(by: disposeBag)
    }

}
