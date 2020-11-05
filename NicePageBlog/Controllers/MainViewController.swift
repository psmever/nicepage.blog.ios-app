//
//  MainViewController.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import Foundation

class MainViewController : ObservableObject {
    
    
//    @Published var getPostListResult: PostItem?

    @Published var getListResult = [PostItem]()
    
    lazy var api: Api = {
        return Api()
    }()
    
    init() {
        debugPrint("MainViewController init")
        
        
        self.getPosts()
        
        
    }
    
    
    func getPosts() {
        api.getPostList() { (state, result) in

            if let decodedData = result?.posts {
                self.getListResult = decodedData
            } else {
                debugPrint("get error")
            }
          

        }
    }
    
    
   
}
