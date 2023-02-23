//
//  SourcesNewsAssembly.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Swinject

class SourcesNewsAssembly: Assembly {

    func assemble(container: Container) {
        
        container.register(NetworkService.self) { r in
            return NetworkserviceImpl()
        }
        
        container.register(SourcesNewsApi.self) { r in
            guard let networkService = r.resolve(NetworkService.self) else {
                fatalError("Fatal Error cannot resolve \(NetworkService.self)")
            }
            return SourcesNewsApiImpl(networkService: networkService)
        }
        
        container.register(SourcesNewsViewModel.self) { r in
            guard let sourceNewsApi = r.resolve(SourcesNewsApi.self) else {
                fatalError("Fatal Error cannot resolve \(SourcesNewsApi.self)")
            }
            return SourcesNewsViewModel(sourcesNewsApi: sourceNewsApi)
        }
    }
}
