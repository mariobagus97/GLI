//
//  NewsListApi.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import RxSwift

protocol NewsListApi {
    func getNewsList(sourceId: String, page: Int, pageSize: Int) -> Observable<NewsListModel?>
    func getSearchArticle(valueSearch: String, source: String, page: Int, pageSize: Int) -> Observable<NewsListModel?>
}
