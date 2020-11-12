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
    
        @Published var login_email: String = ""
        @Published var login_password: String = ""
        
        @Published var login_try_state: Bool = false
        @Published var loginTryErrorMessage: String = ""
        
        
    }
    
}

extension LoginView.ViewModel: ViewModelProtocol {
    
    func initData() {
        
    }
    
    func deinitData() {
        
        
    }
    
    
    func handleTabLoginButton() {
        
        Api().login(email: self.login_email, password: login_password) { (status, message) in
            
            if status {
                self.login_try_state = true
            } else {
                self.login_try_state = false
                if let errorMessage = message {
                    self.loginTryErrorMessage = errorMessage
                }
            }
        }

    }
}
