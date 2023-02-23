//
//  SourcesListModel.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation

// MARK: - SourcesListModel
struct SourcesListModel: Codable {
    let status: String?
    let sources: [Source]?
}
