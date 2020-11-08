//
//  PostListView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import SwiftUI

struct PostListView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List(self.viewModel.initDataSource , id: \.post_id) { post in
                PostListCardView(
                    imageURL: post.thumb_url,
                    category: post.post_title,
                    heading: post.post_title,
                    author: post.list_contents
                )
                .padding(0.5)
            }
            
        }
        .onAppear() {
            self.viewModel.initData()
        }
    }
}

struct PostListView_Previews: PreviewProvider {
    
    static let viewmodel = PostListView.ViewModel()

    static var previews: some View {
        PostListView(viewModel: PostListView_Previews.viewmodel)
    }
}
