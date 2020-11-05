//
//  MainData.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import Foundation
import SwiftUI

final class MainData: ObservableObject  {
    
    @Published var loginCheck: Bool = false
    
    
    private var userDefaultsManager = UserDefaultsManager()
    
    lazy var api: Api = {
        return Api()
    }()
    
    init() {
        debugPrint("MainData init()")
        self.checkLogin()
    }
    
    public func checkLogin() {
        
        if UserDefaultsManager.shared.getAccessToken() != nil {
            api.loginCheck() { (result) in
                debugPrint("login check result : \(result)")
                self.loginCheck = result
            }
        }
    }
}
