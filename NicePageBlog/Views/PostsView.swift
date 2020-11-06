//
//  PostsView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
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

struct PostsView: View {
    
    
    @ObservedObject var postsViewModel: PostsViewModel
    
    init(postsViewModel: PostsViewModel = PostsViewModel()) {
        /// This is example view-mdel implemented for demo purpose.
        self.postsViewModel = postsViewModel
    }
    
    var body: some View{
        NavigationView {

            List(postsViewModel.posts , id: \.post_id) { post in
                NavigationLink(destination: LazyView(PostDetailView(viewModel: PostDetailView.ViewModel(), SlugTitle: post.slug_title))) {
                    VStack(alignment: .leading) {
                        CardView(
                            imageURL: post.thumb_url,
                            category: post.post_title,
                            heading: post.post_title,
                            author: post.list_contents
                        )
                    }
                }
            }

        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        PostsView()
    }
}
