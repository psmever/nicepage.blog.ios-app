//
//  LoginViewModel.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import SwiftUI
import CoreData

extension LoginView {
     
    class ViewModel: ObservableViewModel {
    
        @Published var loginStatus: Bool = false
        @Published var inputEmail: String = ""
        @Published var inputPassword: String = ""
        
        
    }
    
}

extension LoginView.ViewModel: ViewModelProtocol {
    
    func initData() {
        if UserDefaultsManager.shared.getAccessToken() != nil {
            Api().loginCheck() { (result) in
                if result {
                    self.loginStatus = true
                } else {
                    self.loginStatus = false
                }
            }
        } else {
            self.loginStatus = false
        }
    }
    
    func deinitData() {
        
        
    }
    
    
    func handleTabLoginButton(completion: @escaping (Bool, String?) -> Void) {
        Api().login(email: self.inputEmail, password: self.inputPassword) { (status, message) in
            if status {
                self.loginStatus = true
                completion(true, nil)
            } else {
                self.loginStatus = false
                completion(false, message)
            }
        }

    }
}
