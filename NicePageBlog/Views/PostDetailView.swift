//
//  PostDetailView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import SwiftUI

struct PostDetailView: View {
    
    @ObservedObject var postDetailViewModel: PostDetailViewModel
    
    var slugTitle: String = ""
    
    init(_ SlugTitle: String , postDetailViewModel: PostDetailViewModel = PostDetailViewModel()) {
        /// This is example view-mdel implemented for demo purpose.
        self.postDetailViewModel = postDetailViewModel
        
        postDetailViewModel.getPostDetailData(slug_title: SlugTitle)
    }

    var body: some View {
        Text(postDetailViewModel.post_slug_title)
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView("test-test")
    }
}
