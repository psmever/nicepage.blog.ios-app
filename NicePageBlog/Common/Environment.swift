//
//  Environment.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/27.
//

import Foundation

public enum Environment {

    enum Plist {
        
        enum Key {
            static let ServerBaseURL = "SERVER_BASE_URL"
            static let apiKey = "access_token"
        }
        
    }
    
    enum Token {
        static let AccessToken = "access_token"
        static let RefreshToken = "refresh_token"
        static let ExpiresIn = "expires_in"
    }


    private static let infoDictionary: [String: Any] = {
        
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        
        return dict
    }()


    static let ServerBaseURL: URL = {
        
        guard let baseURLstring = Environment.infoDictionary[Plist.Key.ServerBaseURL] as? String else {
            fatalError("Not Found SERVER_BASE_URL Key & Value")
        }
        
        guard let url = URL(string: baseURLstring) else {
            fatalError("baseURLstring URL 값이 없습니다.")
        }
        
        return url
    }()
    
    static let EnvironmentName: String = {
        
        
        
        return "Test"
        
    }()
}
