//
//  PostDetailData.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import Foundation

class PostDetailViewModel : ObservableObject {
    
    lazy var api: Api = {
        return Api()
    }()
    
    @Published var post_slug_title: String = ""
    
    
    
    init() {

    }
    
    
    public func getPostDetailData(slug_title: String) {
        api.getPostDetailData(slug_title) { (status, result) in
            debugPrint("postDetail status: \(status)\n result: \(result?.post_title)")
            
            if let s = status as? Bool, s == true, let r = result {
                debugPrint(r)
            }
        }
    }
    
    
    
}
