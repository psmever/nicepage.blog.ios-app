//
//  PostsViewData.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import Foundation

class PostsViewModel : ObservableObject {

    @Published var posts = [PostItem]()
    
    lazy var api: Api = {
        return Api()
    }()
    
    init() {
        self.getPosts()
    }
    
    func getPosts() {
        api.getPostList() { (state, result) in

            if let postResultData = result?.posts {
                
                DispatchQueue.main.async {
                    self.posts = postResultData
                }
                
            } else {
//                debugPrint("get error")
            }
        }
    }
}
