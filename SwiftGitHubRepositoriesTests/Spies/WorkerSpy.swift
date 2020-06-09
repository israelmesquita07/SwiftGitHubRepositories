//
//  WorkerSpy.swift
//  SwiftGitHubRepositoriesTests
//
//  Created by Israel on 08/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import SwiftGitHubRepositories

class WorkerSpy {
    var fetchRepositoriesCalled: Bool
    
    init() {
        fetchRepositoriesCalled  = false
    }
}

//MARK: - ListRepositoryServicing
extension WorkerSpy: ListRepositoryServicing {
    func fetchRepositories(request: SwiftRepositories.LoadRepositories.Request, completion: @escaping (Result<Repositories, RepositoryError>) -> Void) {
        fetchRepositoriesCalled = true
    }
}
