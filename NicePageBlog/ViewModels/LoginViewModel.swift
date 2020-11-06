//
//  LoginViewModel.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/04.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    lazy var api: Api = {
        return Api()
    }()
    
    @Published var loginStatus: Bool = false
    @Published var showingAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMEssage: String = ""
    
    public var email: String = ""
    public var password: String = ""
    
    public func handleLoginButtonClick() -> Void {
        debugPrint(showingAlert)
        
        guard !email.isEmpty, !password.isEmpty else {

            self.alertTitle = "경고"
            self.alertMEssage = "이메일 및 비밀번호를 입력해 주세요."
            self.showingAlert = true
            return
        }
        
        api.login(email: email, password: password) { (result) in
            switch result {
            case true:
                self.alertTitle = "성공"
                self.alertMEssage = "로그인에 성공 했습니다.."
                self.showingAlert = true
                self.loginStatus = true
            case false:
                self.alertTitle = "실패"
                self.alertMEssage = "로그인에 실패 했습니다."
                self.showingAlert = true
            }
        }
    }
}
