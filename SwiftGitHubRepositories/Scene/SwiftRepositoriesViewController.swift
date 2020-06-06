//
//  SwiftRepositoriesViewController.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol SwiftRepositoriesDisplayLogic: class {
    func displayRepositories(viewModel: SwiftRepositories.LoadRepositories.ViewModel)
    func displayError()
    func toggleLoading(_ bool: Bool)
}

final class SwiftRepositoriesViewController: UIViewController {
    
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
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadRepositories()
    }
    
    private func configureView() {
        title = "Swift Repositories"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: Load Repositories
    
    private func loadRepositories() {
        let request = SwiftRepositories.LoadRepositories.Request(page: 1)
        interactor?.loadRepositories(request: request)
    }
}

//MARK: - SwiftRepositoriesDisplayLogic
extension SwiftRepositoriesViewController: SwiftRepositoriesDisplayLogic {
    func displayRepositories(viewModel: SwiftRepositories.LoadRepositories.ViewModel) {
        print(viewModel.repositories)
    }
    
    func displayError() {
        
    }
    
    func toggleLoading(_ bool: Bool) {
        
    }
}
