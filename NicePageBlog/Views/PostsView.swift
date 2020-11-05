//
//  PostsView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import SwiftUI

struct PostsView: View {
    
    @ObservedObject var postsViewData: PostsViewData = PostsViewData()
    
    var body: some View{
        NavigationView {
            
            List(postsViewData.posts , id: \.post_id) { post in
                NavigationLink(destination: PostDetailView(slug_title: post.slug_title)) {
                    VStack {
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
