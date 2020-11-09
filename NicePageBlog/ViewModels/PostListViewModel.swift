//
//  PostListViewModel.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import SwiftUI
import CoreData

extension PostListView {
    
    class ViewModel: ObservableBaseViewModel<PostItem> {

        init() {
            super.init(initDataSource: [PostItem]())
        }


    }
}

extension PostListView.ViewModel: ViewModelProtocol {
    
    func initData() {
        Api().getPostList { (status, result) in
            if let getResult = result {
                debugPrint(getResult.posts)
                self.initDataSource = getResult.posts
            }
        }
    }
    
    func deinitData() {
        
    }
}

