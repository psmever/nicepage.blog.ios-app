//
//  PostDetailView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import SwiftUI

struct PostDetailView: View {
    
    var postDetailData: PostDetailData = PostDetailData()
    
    var slug_title: String
    
    var body: some View {
        Text("PostDetailView")
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(slug_title: "test-test")
    }
}
