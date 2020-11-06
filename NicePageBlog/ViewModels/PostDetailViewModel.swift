//
//  PostDetailViewModel.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import Foundation

extension PostDetailView {

    class ViewModel: ObservableObject {
        init() {
            debugPrint("PostDetailView ViewModel init")
        }
    }
}

extension PostDetailView.ViewModel {

    func initData(SlugTitle: String) {
        Api().getPostDetailData(SlugTitle) { (status, result) in
            debugPrint(result)
        }
    }
    
    
}
