//
//  SwiftRepositoriesInteractor.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol SwiftRepositoriesBusinessLogic {
    func loadRepositories(request: SwiftRepositories.LoadRepositories.Request)
}

class SwiftRepositoriesInteractor: SwiftRepositoriesBusinessLogic {
    
    var presenter: SwiftRepositoriesPresentationLogic?
    private var worker: ListRepositoryServicing?
    
    // MARK: Load Repositories
    
    func loadRepositories(request: SwiftRepositories.LoadRepositories.Request) {
        worker = SwiftRepositoriesWorker()
        worker?.fetchRepositories(request: request, completion: { result in
            switch result {
            case .success(let repositories):
                let response = SwiftRepositories.LoadRepositories.Response(repositories: repositories)
                self.presenter?.presentRepositories(response: response)
            case .failure(let error):
                print(error)
                self.presenter?.presentError()
            }
        })
    }
}
