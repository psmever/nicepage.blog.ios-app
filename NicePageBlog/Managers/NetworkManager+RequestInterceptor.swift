//
//  NetworkManager+RequestInterceptor.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/29.
//

import Foundation
import Alamofire

extension NetworkManager: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        
        let accessToken : String! = UserDefaultsManager.shared.getAccessToken() != nil ? UserDefaultsManager.shared.getAccessToken() : ""
        let requestToken : String! = accessToken != "" ? "Bearer " + accessToken : ""
        
        request.setValue(requestToken, forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    
    func retry(_ request: Request, for session: Session, dueTo error: Error,
               completion: @escaping (RetryResult) -> Void) {
        guard request.retryCount < retryLimit else {
            completion(.doNotRetry)
            return
        }
        print("\nretried; retry count: \(request.retryCount)\n")
        refreshToken { isSuccess in
            isSuccess ? completion(.retry) : completion(.doNotRetry)
        }
    }
    
    
    
    func refreshToken(completion: @escaping (_ isSuccess: Bool) -> Void) {
        
        AF.request( Environment.ServerBaseURL.absoluteString + "/api/v1/auth/token-refresh", method: .post, encoding: JSONEncoding.default).responseJSON { response in
            
            debugPrint(":: token-refresh ::")
            debugPrint(response)
            
            if let data = response.data, let token = (try? JSONSerialization.jsonObject(with: data, options: [])
                as? [String: Any])?["access_token"] as? String {
                
                debugPrint(response.data)
                
                
//                UserDefaultsManager.shared.setToken(token: token)
//                print("\nRefresh token completed successfully. New token is: \(token)\n")
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
