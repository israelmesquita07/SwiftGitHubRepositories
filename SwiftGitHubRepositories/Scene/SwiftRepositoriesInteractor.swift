//
//  SwiftRepositoriesInteractor.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol SwiftRepositoriesBusinessLogic {
    func loadRepositories(request: SwiftRepositories.Repositories.Request)
}

class SwiftRepositoriesInteractor: SwiftRepositoriesBusinessLogic {
    
    var presenter: SwiftRepositoriesPresentationLogic?
    
    // MARK: Load Repositories
    
    func loadRepositories(request: SwiftRepositories.Repositories.Request) {
        let worker = SwiftRepositoriesWorker()
        worker.fetchRepositories()
        
        let response = SwiftRepositories.Repositories.Response()
        presenter?.presentRepositories(response: response)
    }
}
