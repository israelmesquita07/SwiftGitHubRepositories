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
    func presentError(title: String, message: String)
    func toggleLoading(_ bool: Bool)
}

final class SwiftRepositoriesPresenter: SwiftRepositoriesPresentationLogic {
    
    weak var viewController: SwiftRepositoriesDisplayLogic?
    
    // MARK: Present Repositories
    
    func presentRepositories(response: SwiftRepositories.LoadRepositories.Response) {
        let viewModel = SwiftRepositories.LoadRepositories.ViewModel(items: response.items)
        viewController?.displayRepositories(viewModel: viewModel)
    }
    
    func presentError(title: String, message: String) {
        viewController?.displayError(title: title, message: message)
    }
    
    func toggleLoading(_ bool: Bool) {
        viewController?.toggleLoading(bool)
    }
}
