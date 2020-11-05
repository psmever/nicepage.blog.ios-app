//
//  ContentView.swift
//  NicePageBlog
//
//  Created by sm on 2020/10/27.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var mainData: MainData = MainData()
    
    var body: some View {
        if mainData.loginCheck {
            return AnyView(PostsView())
        }else {
            return AnyView(LoginView())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
