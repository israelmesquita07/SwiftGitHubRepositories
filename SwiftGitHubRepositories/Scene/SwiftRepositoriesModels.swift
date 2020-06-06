//
//  SwiftRepositoriesModels.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

enum SwiftRepositories {
    // MARK: Use cases
    
    enum LoadRepositories {
        
        struct Request {
            let page: Int
        }
        
        struct Response {
            let repositories: Repositories
        }
        
        struct ViewModel {
            let repositories: Repositories
        }
    }
}
