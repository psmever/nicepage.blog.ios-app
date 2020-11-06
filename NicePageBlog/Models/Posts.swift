//
//  Posts.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/05.
//

import Foundation


struct Post: Codable {
    let per_page: String
    let current_page: Int
    let hasmore: Bool
    let posts: [PostItem]
}


struct PostItem: Codable {
    let post_id: Int
    let post_uuid: String
    let user: UserInfo
    let post_title: String
    let slug_title: String
    let list_contents: String
    let markdown: String
    let tags: [TagsItem]
    let thumb_url: String
    let view_count: Int
    let post_active: String
    let post_publish: String
    let list_created: String
}

struct TagsItem: Codable {
    let tag_id: String?
    let tag_text: String?
}

struct PostDetail: Codable {
    let post_uuid: String
    let user: UserDetailInfo
    let post_title: String
    let slug_title: String
    let contents_html: String
    let contents_text: String
    let markdown: String
    let tags: [TagsItem]?
    let view_count: Int
    let detail_created: String
    let detail_updated: String
}
