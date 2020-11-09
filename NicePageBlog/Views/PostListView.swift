//
//  PostListView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    var body: Content {
        build()
    }
}

struct PostListView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List(self.viewModel.initDataSource , id: \.post_id) { post in
                NavigationLink(destination: LazyView(PostDetailView(viewModel: PostDetailView.ViewModel(), slugTitle: post.slug_title))) {
                    VStack(alignment: .leading) {
                        PostListCardView(
                            imageURL: post.thumb_url,
                            category: post.post_title,
                            heading: post.post_title
                        )
                    }
                }
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
