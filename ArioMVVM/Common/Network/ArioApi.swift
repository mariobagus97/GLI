//
//  ArioApi.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation

enum NewAPIVersion {
    case v1
    case v2
}

enum ArioApi {
    case newsList(sourceId: String, page: Int, pageSize: Int)
    case sourceList(category: String)
    case searchArticleNews(valueSearch: String, filterSource: String, page: Int, pageSize: Int)
    
    func urlString() -> String {
        return Constants.urlNews + apiString()
    }
    
    func apiString() -> String {
        switch self {
        case .newsList(let sourceId, let page, let pageSize):
            return "/top-headlines?apiKey=\(Constants.apiKey)&sources=\(sourceId)&page=\(String(page))&pageSize=\(String(pageSize))"
        case .sourceList(let category):
            return "/top-headlines/sources?apiKey=\(Constants.apiKey)&category=\(category)"
        case .searchArticleNews(let valueSearch, let filterSource, let page, let pageSize):
            return "/top-headlines?q=\(valueSearch)&apiKey=\(Constants.apiKey)&sources=\(filterSource)&page=\(String(page))&pageSize=\(String(pageSize))"
        }
    }
}
