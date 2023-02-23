//
//  NetworkService.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import RxSwift

protocol NetworkService {
    func get(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data>
    func post(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data>
    func put(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data>
    func delete(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data>
    func patch(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data>
}
    
extension NetworkService {
    func get(urlString: String,
             bodyParams: [String: Any] = [:],
             header: [String: String] = [:],
             isNeedAuthorization: Bool = true) -> Observable<Data> {
        return self.get(urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    
    func post(urlString: String,
              bodyParams: [String: Any] = [:],
              header: [String: String] = [:],
              isNeedAuthorization: Bool = true) -> Observable<Data> {
        return self.post(urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    
    func put(urlString: String,
              bodyParams: [String: Any] = [:],
              header: [String: String] = [:],
             isNeedAuthorization: Bool = true) -> Observable<Data> {
        return self.put(urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    
    func delete(urlString: String,
              bodyParams: [String: Any] = [:],
              header: [String: String] = [:],
                isNeedAuthorization: Bool = true) -> Observable<Data> {
        return self.delete(urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    func patch(urlString: String,
              bodyParams: [String: Any] = [:],
              header: [String: String] = [:],
               isNeedAuthorization: Bool = true) -> Observable<Data> {
        return self.patch(urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    
    
}
