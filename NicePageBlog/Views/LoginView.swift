//
//  LoginView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/04.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginViewController: LoginViewController = LoginViewController()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    
    let verticalPaddingForForm = 40.0
    
    var body: some View {
        NavigationView {
            ZStack {
                if loginViewController.loginStatus == false {
                    Color.blue
                    VStack(spacing: CGFloat(verticalPaddingForForm)) {
                        Text("psmever's Blog")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        HStack {
                            Image(systemName: "person").foregroundColor(.secondary)
                            TextField("이메일", text: $loginViewController.email).foregroundColor(Color.black)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        HStack {
                            Image(systemName: "person").foregroundColor(.secondary)
                            SecureField("비밀번호", text: $loginViewController.password).foregroundColor(Color.black)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        Button(action: loginViewController.handleLoginButtonClick) {
                            Text("로그인")
                            .padding()
                            
                        }
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        
                    }.padding(.horizontal, CGFloat(verticalPaddingForForm))
                    .alert(isPresented: $loginViewController.showingAlert, title: loginViewController.alertTitle, message: loginViewController.alertMEssage)
                } else {
                    MainView()
                }
            }
        }
    };
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}
