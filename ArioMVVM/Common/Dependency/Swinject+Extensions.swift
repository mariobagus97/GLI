//
//  Swinject+Extensions.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//
import Swinject

extension Assembler {
    static let sharedAssembler: Assembler = {
        let container = Container()
        let assembler = Assembler([
            NewsListAssembly(),
            SourcesNewsAssembly()
        ], container: container)
        return assembler
    }()

}
