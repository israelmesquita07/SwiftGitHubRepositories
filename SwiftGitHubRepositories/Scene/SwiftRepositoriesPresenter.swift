//
//  SwiftRepositoriesPresenter.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol SwiftRepositoriesPresentationLogic {
    func presentRepositories(response: SwiftRepositories.Repositories.Response)
}

class SwiftRepositoriesPresenter: SwiftRepositoriesPresentationLogic {
    
    weak var viewController: SwiftRepositoriesDisplayLogic?
    
    // MARK: Present Repositories
    
    func presentRepositories(response: SwiftRepositories.Repositories.Response) {
        let viewModel = SwiftRepositories.Repositories.ViewModel()
        viewController?.displayRepositories(viewModel: viewModel)
    }
}
