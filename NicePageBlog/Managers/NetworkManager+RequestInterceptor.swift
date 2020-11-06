//
//  NetworkManager+RequestInterceptor.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/29.
//

import Foundation
import Alamofire
import SwiftyJSON

extension NetworkManager: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        
        let accessToken : String! = UserDefaultsManager.shared.getAccessToken() != nil ? UserDefaultsManager.shared.getAccessToken() : ""
        let requestToken : String! = accessToken != "" ? "Bearer " + accessToken : ""
        
        request.setValue(requestToken, forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        debugPrint(request)
       
        guard let statusCode = request.response?.statusCode else {
            completion(.doNotRetry)
            return
        }
        
        debugPrint("retry statusCode : \(statusCode)")
        
        switch statusCode {
        case 200...299:
            completion(.doNotRetry)
        case 401:
            refreshToken { (success) in
//                self.validToken = Credential.currentToken
                completion(.doNotRetry)
            }
        default:
            completion(.doNotRetry)
        }
    }
    
    func refreshToken(completion: @escaping (_ isSuccess: Bool) -> Void) {
        if let refreshToken = UserDefaultsManager.shared.getRefreshToken() {
            
            let headers: HTTPHeaders = [
                "Request-Client-Type" : "S01010",
                "Content-Type" : "application/json",
                "Accept" : "application/json"
            ]
            
            let PARAM: Parameters = [
                "refresh_token": refreshToken
            ]
            
            AF.request(
                Environment.ServerBaseURL.absoluteString + "/api/v1/auth/token-refresh",
                method: .post,
                parameters: PARAM,
                encoding: JSONEncoding.default,
                headers: headers
            ).validate().responseData(completionHandler: { response in
                if let code = response.response?.statusCode {
                    switch code {
                        case 200:
                            let refreshResult = JSON(response.value)
                            let accessToken: String = refreshResult["access_token"].stringValue
                            let refreshToken: String = refreshResult["refresh_token"].stringValue
                            
                            UserDefaultsManager.shared.setAccessToken(token: accessToken)
                            UserDefaultsManager.shared.setRefreshToken(token: refreshToken)
                            
                            debugPrint("Refresh token completed successfully.")
                        default:
                            debugPrint("Refresh token completed fail.")
                            UserDefaultsManager.shared.deleteAllData()
                    }
                }
            })
        } else {
            debugPrint("refresh try get token error")
            completion(false)
        }
    }
}
