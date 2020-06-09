//
//  SwiftRepositoriesInteractor.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol SwiftRepositoriesBusinessLogic {
    func loadRepositories()
    func refreshItems()
}

final class SwiftRepositoriesInteractor: SwiftRepositoriesBusinessLogic {
    
    var presenter: SwiftRepositoriesPresentationLogic?
    var page = 1, totalPages = Constants.totalPages
    var worker: ListRepositoryServicing?
    var items: [Item] = []
    
    // MARK: Load Repositories
    
    func loadRepositories() {
        presenter?.toggleLoading(true)
        page = page > totalPages ? 1 : page
        let request = SwiftRepositories.LoadRepositories.Request(page: page)
        worker = worker ?? SwiftRepositoriesWorker()
        worker?.fetchRepositories(request: request, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let repositories):
                self.page += self.page
                self.items += repositories.items
                let response = SwiftRepositories.LoadRepositories.Response(items: self.items)
                self.presenter?.presentRepositories(response: response)
                self.presenter?.toggleLoading(false)
            case .failure(let error):
                switch error {
                case .internetFailure:
                    self.presenter?.presentError(title: "Ops!", message: "Parece que sua conexão está instável")
                default:
                    self.presenter?.presentError(title: "Ops!", message: "Ocorreu algum erro 😢")
                }
                self.presenter?.toggleLoading(false)
            }
        })
    }
    
    func refreshItems() {
        page = 1
        items = []
        loadRepositories()
    }
}
