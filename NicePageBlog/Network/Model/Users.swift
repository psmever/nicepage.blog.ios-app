//
//  LoginModels.swift
//  NicePageBlog
//
//  Created by sm on 2020/11/03.
//

import Foundation

struct Login: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String
    let token_type: String
}

struct LoginCheck: Codable {
    let user_uuid: String
}
