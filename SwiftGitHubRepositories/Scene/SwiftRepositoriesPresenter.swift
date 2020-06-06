//
//  SwiftRepositoriesPresenter.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol SwiftRepositoriesPresentationLogic {
    func presentRepositories(response: SwiftRepositories.LoadRepositories.Response)
    func presentError()
    func toggleLoading(_ bool: Bool)
}

class SwiftRepositoriesPresenter: SwiftRepositoriesPresentationLogic {
    
    weak var viewController: SwiftRepositoriesDisplayLogic?
    
    // MARK: Present Repositories
    
    func presentRepositories(response: SwiftRepositories.LoadRepositories.Response) {
        let viewModel = SwiftRepositories.LoadRepositories.ViewModel(repositories: response.repositories)
        viewController?.displayRepositories(viewModel: viewModel)
    }
    
    func presentError() {
        viewController?.displayError()
    }
    
    func toggleLoading(_ bool: Bool) {
        viewController?.toggleLoading(bool)
    }
}
