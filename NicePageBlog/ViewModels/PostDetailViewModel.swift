//
//  PostDetailViewModel.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import SwiftUI
import CoreData

extension PostDetailView {
    
    class ViewModel: ObservableSingleViewModel<PostDetail> {
        
//        public var postDetail: PostDetail | nil = nil
          
        @Published var post_uuid: String = ""
        @Published var post_title: String = ""
        @Published var contents_html: String = ""
        @Published var contents_text: String = ""
        
        
        
        init() {
            super.init(initDataSource: [PostDetail]())
        }
    }
}

extension PostDetailView.ViewModel: ViewModelProtocol {
    
    func initData() {

    }
    
    func getPostDetailData(slugTitle: String) {
        debugPrint("slugTitle : \(slugTitle)")
        
        Api().getPostDetailData(slugTitle) { (status, post_detail) in
            if let postDetail = post_detail {
                self.initDataSource = [postDetail]
                
                debugPrint(postDetail.post_uuid)
                
                
                self.post_uuid = postDetail.post_uuid
                self.post_title = postDetail.post_title
                self.contents_html = postDetail.contents_html
                
                self.contents_text = postDetail.contents_text
                
            }
            
            self.printInitData()
        }
    }
    
    func deinitData() {
        
    }
    
    func printInitData() {
        debugPrint("initDataSource : \(self.initDataSource)")
    }
}

