//
//  MainViewModel.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import Foundation
import SwiftUI

final class MainViewModel: ObservableObject  {
    
    @Published var loginCheck: Bool = false
    
    lazy var api: Api = {
        return Api()
    }()
    
    init() {
        self.checkLogin()
    }
    
    public func checkLogin() {
        if UserDefaultsManager.shared.getAccessToken() != nil {
            api.loginCheck() { (result) in
                self.loginCheck = result
            }
        }
    }
}
