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
    
    
    @ObservedObject var postsViewData: PostsViewData
    
    init(postsViewData: PostsViewData = PostsViewData()) {
        /// This is example view-mdel implemented for demo purpose.
        self.postsViewData = postsViewData
    }
    
    var body: some View{
        NavigationView {

            List(postsViewData.posts , id: \.post_id) { post in
                NavigationLink(destination: LazyView(PostDetailView(post.slug_title))) {
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
