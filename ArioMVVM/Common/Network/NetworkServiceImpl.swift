//
//  NetworkServiceImpl.swift
//  ArioMVVM
//
//  Created by Muhammad ario bagus on 24/02/23.
//

import Alamofire
import RxSwift

class NetworkserviceImpl: NetworkService {
    static let kGatewayTimeoutErrorCode = 503
    
    func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
    
    func get(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data> {
        return requestMethod(method: .get, urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    
    func post(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data> {
        return requestMethod(method: .post, urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    
    func put(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data> {
        return requestMethod(method: .put, urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    
    func delete(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data> {
        return requestMethod(method: .delete, urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    
    func patch(urlString: String, bodyParams: [String: Any], header: [String: String], isNeedAuthorization: Bool) -> Observable<Data> {
        return requestMethod(method: .patch, urlString: urlString, bodyParams: bodyParams, header: header, isNeedAuthorization: isNeedAuthorization)
    }
    
    private func requestMethod(method: HTTPMethod,
                               urlString: String,
                               bodyParams: [String: Any],
                               header: [String: String],
                               isNeedAuthorization: Bool) -> Observable<Data> {
        return Observable<Data>.create { [weak self] observer in
            guard let weakSelf = self,
                  let url = URL(string: urlString) else {
                return Disposables.create {}
            }
            
            if self?.isConnectedToInternet() == false {
                observer.onError(NSError(domain: "", code: NSURLErrorNotConnectedToInternet, userInfo: nil))
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
            
            header.forEach { (key, value) in
                urlRequest.setValue(key, forHTTPHeaderField: value)
            }
            
            if !bodyParams.isEmpty,
               let bodyData = try? JSONSerialization.data(withJSONObject: bodyParams, options: []) {
                urlRequest.httpBody = bodyData
            }
            
            let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    if httpResponse.statusCode != 200 {
                        observer.onError(NSError(domain: "", code: NSURLErrorNotConnectedToInternet, userInfo: nil))
                    } else {
                        if let error = error {
                            observer.on(.error(error))
                        } else if let data = data {
                            
                            if let responseError = try? JSONDecoder()
                                .decode(ResponseError.self, from: data),
                               let firstError = responseError.errors?.first {
                                observer.on(.error(firstError))
                            } else {
                                observer.on(.next(data))
                            }
                        }
                    }
                } else {
                    observer.onError(NSError(domain: "", code: NSURLErrorNotConnectedToInternet, userInfo: nil))
                }
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
