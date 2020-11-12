//
//  LoginView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var loginButtonClick: Bool = false
    @State private var login_validated_alert: Bool = false
    @State private var login_check_alert: Bool = false
    
    private var thisValidated: Bool {
        !self.viewModel.login_email.isEmpty && !self.viewModel.login_password.isEmpty
    }
    
    let verticalPaddingForForm = 40.0
    
    var body: some View {
        
        Background {
            
            ZStack {
                
                VStack(spacing: CGFloat(verticalPaddingForForm)) {
                    
                    Text("psmever's Blog")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    HStack {
                        Image(systemName: "person").foregroundColor(.secondary)
                        TextField("이메일", text: self.$viewModel.login_email).foregroundColor(Color.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    HStack {
                        Image(systemName: "person").foregroundColor(.secondary)
                        TextField("비밀번호", text: self.$viewModel.login_password).foregroundColor(Color.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Button(action: {
                        
                        if(!thisValidated) {
                            self.login_validated_alert = true
                            return
                        } else {
                            self.viewModel.handleTabLoginButton()
                        }

                    }) {
                        Text("로그인")
                        .padding()
                    }
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    
                }.padding(.horizontal, CGFloat(verticalPaddingForForm))
                .alert(isPresented: $login_validated_alert, title: "경고", message: "로그인 정보를 입력해 주세요.")
            }
        
        }.onTapGesture {
            self.resignFirstResponder()
        }
        .onAppear() {
            
        }
    }
    
    private func resignFirstResponder() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color.blue
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            
        .overlay(content)
    }
}









struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewModel: LoginView.ViewModel())
    }
}
