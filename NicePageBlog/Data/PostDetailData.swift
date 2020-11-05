//
//  PostDetailData.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import Foundation

final class PostDetailData {
    lazy var api: Api = {
        return Api()
    }()
    
    init() {
        debugPrint("PostDetailData init()")
        
        self.getPostDetailData()
    }
    
    
    public func getPostDetailData() {
        api.getPostDetailData("글-등록-테스트") { (status, result) in
            debugPrint("postDetail status: \(status)\n result: \(result)")
        }
    }
    
    
    
}
