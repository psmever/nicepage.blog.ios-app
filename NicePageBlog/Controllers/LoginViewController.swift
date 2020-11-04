//
//  LoginViewController.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/04.
//

import Foundation
import Toast

class LoginViewController: ObservableObject {
    
    lazy var api: Api = {
        return Api()
    }()
    
    
    public var email: String = ""
    public var password: String = ""
    
    
    
    public func handleLoginButtonClick() -> Void {
        
        debugPrint(" email: \(email) password: \(password)")
        debugPrint("handleLoginButtonClick")
        
        
        guard !email.isEmpty, !password.isEmpty else {
            debugPrint("empty")
            


            
            return
        }
        
        api.login(email: email, password: password) { (result) in
            switch result {
            case true:
                debugPrint("login try success")
            case false:
                debugPrint("login try fail.")
            }
        }
    }
}
