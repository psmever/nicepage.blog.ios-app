//
//  UserDefaultsManager.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/29.
//


import Foundation
class UserDefaultsManager {
    
    enum Key: String {
        case apiKey
        case secretKey
        case token
        case access_token
        case refresh_token
        case isSignedIn
    }
    
    static let shared: UserDefaultsManager = {
        return UserDefaultsManager()
    }()
    
    func getUserCredentials() -> (apiKey: String?, secretKey: String?) {
        let apiKey = UserDefaults.standard.string(forKey: Key.apiKey.rawValue)
        let secretKey = UserDefaults.standard.string(forKey: Key.secretKey.rawValue)
        return (apiKey, secretKey)
    }
    
    func setUserCredentials(apiKey: String, secretKey: String) {
        UserDefaults.standard.set(apiKey, forKey: Key.apiKey.rawValue)
        UserDefaults.standard.set(secretKey, forKey: Key.secretKey.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getToken() -> String? {
        return UserDefaults.standard.string(forKey: Key.token.rawValue)
    }
    
    func getAccessToken() -> String? {
        return UserDefaults.standard.string(forKey: Key.access_token.rawValue)
    }
    
    func getRefreshToken() -> String? {
        return UserDefaults.standard.string(forKey: Key.refresh_token.rawValue)
    }
    
    func setAccessToken(token: String) {
        UserDefaults.standard.set(token, forKey: Key.access_token.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func setRefreshToken(token: String) {
        UserDefaults.standard.set(token, forKey: Key.refresh_token.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func deleteAllData() {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()

        dictionary.keys.forEach {
            key in   defaults.removeObject(forKey: key)
        }
    }
    

}

