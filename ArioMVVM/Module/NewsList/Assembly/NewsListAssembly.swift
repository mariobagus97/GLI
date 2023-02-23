//
//  NewsListAssembly.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//
import Swinject

class NewsListAssembly: Assembly {

    func assemble(container: Container) {
        
        container.register(NetworkService.self) { r in
            return NetworkserviceImpl()
        }
        
        container.register(NewsListApi.self) { r in
            guard let networkService = r.resolve(NetworkService.self) else {
                fatalError("Fatal Error cannot resolve \(NetworkService.self)")
            }
            return NewsListApiImpl(networkService: networkService)
        }
        
        container.register(NewsListViewModel.self) { r in
            guard let resultApi = r.resolve(NewsListApi.self) else {
                fatalError("Fatal Error cannot resolve \(NewsListApi.self)")
            }
            return NewsListViewModel(newsListApi: resultApi)
        }
    }
}
