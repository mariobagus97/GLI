//
//  ResponseErrorModel.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Foundation

struct ResponseErrorArrayModel: Codable, Error {
    var errors: [ResponseErrorModel]?
    
    enum CodingKeys: String, CodingKey {
        case errors
    }
}

struct ResponseErrorModel: Codable, Error {
    var title: String?
    var detail: String?
    var errorImageUrl: String?
    var status: NSNumber?
    var code: String?
    var field: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case detail
        case code
        case field
    }
}

extension ResponseErrorModel {
    
    init(systemError: NSError) {
        self.init()
        self.status = systemError.code as NSNumber

        if systemError.code == NSURLErrorNotConnectedToInternet ||
            systemError.code == NSURLErrorNetworkConnectionLost  ||
            systemError.code == NetworkserviceImpl.kGatewayTimeoutErrorCode {
            
            self.title = "error title"
            self.detail = "error detail"
        } else {
            self.title = systemError.localizedDescription
            self.detail = systemError.localizedRecoverySuggestion
        }
    }
}
