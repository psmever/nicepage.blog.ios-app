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

struct UserInfo: Codable {
    let user_uuid: String
    let name: String
    let nickname: String
    let email: String
}

struct CodeInfo: Codable {
    let code_id: String
    let code_name: String
}

struct UserDetailInfo: Codable {
    let user_uuid: String
    let user_type: CodeInfo
    let user_level: CodeInfo
    let name: String
    let nickname: String
    let email: String
    let active: String
}
