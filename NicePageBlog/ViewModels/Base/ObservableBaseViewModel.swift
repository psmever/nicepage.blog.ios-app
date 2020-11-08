//
//  ObservableBaseViewModel.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/09.
//

import Foundation

class ObservableBaseViewModel<T>: ObservableObject {
    
    @Published public var initDataSource: [T]
    
    init(initDataSource: [T]) {
        self.initDataSource = initDataSource
    }
}
