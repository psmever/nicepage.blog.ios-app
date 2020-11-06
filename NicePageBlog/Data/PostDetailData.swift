//
//  PostDetailData.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import Foundation

class PostDetailData : ObservableObject {
    
    lazy var api: Api = {
        return Api()
    }()
    
    @Published var post_slug_title: String = ""
    
    init() {
        debugPrint("PostDetailData init()")
    }
    
    
    public func getPostDetailData(slug_title: String) {
        api.getPostDetailData("글-등록-테스트") { (status, result) in
            debugPrint("postDetail status: \(status)\n result: \(result)")
        }
    }
    
    
    
}
