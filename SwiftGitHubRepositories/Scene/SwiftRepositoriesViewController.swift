//
//  SwiftRepositoriesViewController.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol SwiftRepositoriesDisplayLogic: class {
    func displayRepositories(viewModel: SwiftRepositories.Repositories.ViewModel)
}

final class SwiftRepositoriesViewController: UIViewController, SwiftRepositoriesDisplayLogic {
    
    private var interactor: SwiftRepositoriesBusinessLogic?
    
    // MARK: Setup
    
    private func setup() {
        let interactor = SwiftRepositoriesInteractor()
        let presenter = SwiftRepositoriesPresenter()
        self.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = self
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadRepositories()
    }
    
    // MARK: Load Repositories
    
    func loadRepositories() {
        let request = SwiftRepositories.Repositories.Request()
        interactor?.loadRepositories(request: request)
    }
    
    func displayRepositories(viewModel: SwiftRepositories.Repositories.ViewModel) {
        
    }
}
