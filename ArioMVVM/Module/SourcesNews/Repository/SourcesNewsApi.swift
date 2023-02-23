//
//  SourcesNewsApi.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation

import RxSwift

protocol SourcesNewsApi {
    func getSourcesList(category: String) -> Observable<SourcesListModel?>
}
