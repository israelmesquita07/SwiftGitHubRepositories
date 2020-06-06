//
//  Endpoints.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
struct Endpoints {
    static let baseUrl = "https://api.github.com/search/repositories?q=language:swift&sort=stars"
    static let urlPage = "\(Endpoints.baseUrl)&page="
}
