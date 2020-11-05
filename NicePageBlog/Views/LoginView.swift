//
//  LoginView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/04.
//

import SwiftUI

struct Background<Content: View>: View {
    private var content: Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        Color.white
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .overlay(content)
    }
}

struct LoginView: View {
    
    @ObservedObject var loginViewData: LoginViewData = LoginViewData()
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showingAlert = false
    
    let verticalPaddingForForm = 40.0
    
    var body: some View {
    
        Background {
            
            ZStack {
                Color.blue
                VStack(spacing: CGFloat(verticalPaddingForForm)) {
                    Text("psmever's Blog")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    HStack {
                        Image(systemName: "person").foregroundColor(.secondary)
                        TextField("이메일", text: $loginViewData.email).foregroundColor(Color.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    HStack {
                        Image(systemName: "person").foregroundColor(.secondary)
                        SecureField("비밀번호", text: $loginViewData.password).foregroundColor(Color.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    Button(action: loginViewData.handleLoginButtonClick) {
                        Text("로그인")
                        .padding()
                        
                    }
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    
                }.padding(.horizontal, CGFloat(verticalPaddingForForm))
                .alert(isPresented: $loginViewData.showingAlert, title: loginViewData.alertTitle, message: loginViewData.alertMEssage)
            }
        
        }.onTapGesture {
            self.resignFirstResponder()
        }
        
    }
    
    private func resignFirstResponder() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}
