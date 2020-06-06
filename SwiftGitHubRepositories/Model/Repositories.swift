//
//  Repositories.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation

struct Repositories: Decodable {
    let items: [Item]?
    let totalCount:Int?
    
    enum CodingKeys: String, CodingKey {
        case items
        case totalCount = "total_count"
    }
}

struct Item: Decodable {
    let id: Int?
    let name: String?
    let stargazersCount: Int?
    let owner: Owner?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case stargazersCount = "stargazers_count"
        case owner
    }
}

struct Owner: Decodable {
    let login: String?
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}
