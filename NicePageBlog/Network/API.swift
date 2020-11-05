//
//  API.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/30.
//

import Foundation
import Alamofire
import SwiftyJSON

final class Api {
    
    private var userDefaultsManager = UserDefaultsManager();
    
    static let shared: Api = {
        return Api()
    }()
    
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {

        let PARAM:Parameters = [
            "email": email,
            "password": password
        ]
        
        NetworkManager.shared.request(Environment.ServerBaseURL.absoluteString + "/api/v1/auth/login", method: .post, parameters: PARAM) { ( result: Result<Login, ErrorResponse> ) in
            switch result {
            case .success(let result):
                let access_token: String = result.access_token
                let refresh_token: String = result.refresh_token
                let expires_in: Int = result.expires_in
                
                if(access_token.count > 0 && refresh_token.count > 0) {
                    self.userDefaultsManager.setAccessToken(token: access_token)
                    self.userDefaultsManager.setRefreshToken(token: refresh_token)
                    completion(true)
                } else {
                    completion(false)
                }
            case .failure(let error):
                debugPrint("\(error.error_message)")
                completion(false)
            }
        }
    }
    
    func loginCheck(completion: @escaping (Bool) -> Void) {
        NetworkManager.shared.request(Environment.ServerBaseURL.absoluteString + "/api/v1/auth/login-check", method: .get) { ( result: Result<LoginCheck, ErrorResponse> ) in
            switch result{
            case .success(let result):
                debugPrint("login check user_uuid: \(result.user_uuid)")
                completion(true)
            case .failure(let error):
                debugPrint("\(error.error_message)")
                completion(false)
            }
        }
    }
    
    func getPostList(completion: @escaping (Bool, Post?) -> Void) {
        NetworkManager.shared.request(Environment.ServerBaseURL.absoluteString + "/api/v1/post/1", method: .get) { ( result: Result<Post, ErrorResponse> ) in
            switch result{
            case .success(let result):
                completion(true, result)
            case .failure(let error):
                debugPrint("post error: \(error)")
                completion(false, nil)
            }
        }
    }
    
    
}
