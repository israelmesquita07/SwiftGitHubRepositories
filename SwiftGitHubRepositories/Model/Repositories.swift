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
}

struct Item: Decodable {
    let id: Int?
    let name: String?
    let stargazersCount: Int?
    let owner: Owner?
}

struct Owner: Decodable {
    let login: String?
    let avatarUrl: String?
}
