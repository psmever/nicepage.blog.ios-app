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
    
    func loginCheck() {
        NetworkManager.shared.request(Environment.ServerBaseURL.absoluteString + "/api/v1/auth/login-check", method: .get) { ( result: Result<LoginCheck, ErrorResponse> ) in
            print(":: loginCheck RESULT START ::")
            switch result{
            case .success(let result):
                
                debugPrint(result)


            case .failure(let error):
                debugPrint("\(error.error_message)")

            }
            print(":: loginCheck RESULT END ::")
        }
    }
    
    
}
