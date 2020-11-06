//
//  PostDetailView.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import SwiftUI

struct PostDetailView: View {
    
    @ObservedObject var viewModel: ViewModel
    var SlugTitle: String
    
//    var slugTitle: String = ""
//
//    init(_ SlugTitle: String , postDetailViewModel: PostDetailViewModel = PostDetailViewModel()) {
//        /// This is example view-mdel implemented for demo purpose.
//        self.postDetailViewModel = postDetailViewModel
//
//        postDetailViewModel.getPostDetailData(slug_title: SlugTitle)
//    }

    var body: some View {
//        Text(postDetailViewModel.post_slug_title)
        VStack {

        }
        .animation(.linear)
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarTitle(Text(SlugTitle))
        .onAppear() {
            self.viewModel.initData(SlugTitle: SlugTitle)
            
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    
    static let home = PostDetailView.ViewModel()
    
    static var previews: some View {
        PostDetailView(viewModel: PostDetailView_Previews.home, SlugTitle: "asdasd")
    }
}
