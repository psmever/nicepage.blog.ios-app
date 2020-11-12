//
//  LoginView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: ViewModel
        

    @State var loginStatus: Bool = false
    
    
    
    @State var alertState: Bool = false
    @State var alertMessage: String = ""
    
    public var viewIndex: Int = 1
    public var thisValidated: Bool = true
    
    let verticalPaddingForForm = 40.0
    
    var body: some View {
        
        if loginStatus {
            PostListView(viewModel: PostListView.ViewModel())
        } else {
            Background {
                    ZStack {
                        
                        VStack(spacing: CGFloat(verticalPaddingForForm)) {
                            
                            Text("psmever's Blog")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            HStack {
                                Image(systemName: "person").foregroundColor(.secondary)
                                TextField("이메일", text: self.$viewModel.inputEmail).foregroundColor(Color.black)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            
                            HStack {
                                Image(systemName: "person").foregroundColor(.secondary)
                                SecureField("비밀번호", text: self.$viewModel.inputPassword).foregroundColor(Color.black)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            
                            Button(action: {
                                
                                if self.loginValidated() {
                                    self.viewModel.handleTabLoginButton(completion: { (status, message) in
                                        
                                        if status {
                                            self.loginStatus = true
                                        } else {
                                            self.alertState = true
                                            self.alertMessage = message ?? "로그인에 실패 했습니다."
                                        }
                                    })
                                }
                                
                            }) {
                                Text("로그인")
                                .padding()
                            }
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            
                        }.padding(.horizontal, CGFloat(verticalPaddingForForm))
                        .alert(isPresented: $alertState, title: "경고", message: self.alertMessage)
                    }
           
            }.onTapGesture {
                self.resignFirstResponder()
            }
            .onAppear() {
                self.viewModel.initData()
            }
        }
    }
    
    private func resignFirstResponder() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    fileprivate func loginValidated() -> Bool {
        
        if(self.viewModel.inputEmail == "") {
            self.alertMessage = "로그인 이메일을 입력해 주세요."
            self.alertState.toggle()
            return false
        }
        
        if (self.viewModel.inputPassword == "") {
            self.alertMessage = "로그인 비밀 번호를 입력해 주세요."
            self.alertState.toggle()
            return false
        }
        
        return true
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
