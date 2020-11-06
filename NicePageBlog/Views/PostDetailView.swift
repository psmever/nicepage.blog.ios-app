//
//  PostDetailView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import SwiftUI

struct PostDetailView: View {
    
    @ObservedObject var postDetailData: PostDetailData
    
    var slugTitle: String = ""
    
    init(_ SlugTitle: String , postDetailData: PostDetailData = PostDetailData()) {
        /// This is example view-mdel implemented for demo purpose.
        self.postDetailData = postDetailData
        
        postDetailData.getPostDetailData(slug_title: SlugTitle)
    }

    var body: some View {
        Text(postDetailData.post_slug_title)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView("test-test")
    }
}
