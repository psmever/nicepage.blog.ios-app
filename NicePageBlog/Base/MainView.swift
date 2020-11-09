//
//  MainView.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/27.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var mainViewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        if mainViewModel.loginCheck {
            return AnyView(PostListView(viewModel: PostListView.ViewModel()))
        } else {
            return AnyView(LoginView(viewModel: LoginView.ViewModel()))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
