//
//  ContentView.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/27.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some View {
//        if mainViewModel.loginCheck {
//            return AnyView(PostsView())
//        }else {
//            return AnyView(LoginView())
//        }
        Text("Hello, psmever's Blog")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}