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
    func displayError(title: String, message: String)
    func toggleLoading(_ bool: Bool)
}

final class SwiftRepositoriesViewController: UIViewController {
    
    var interactor: SwiftRepositoriesBusinessLogic?
    lazy var viewScreen = SwiftRepositoriesViewScreen(delegate: self)
    
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
        setupViewScreen()
    }
    
    private func setupViewScreen() {
        viewScreen.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewScreen)
        NSLayoutConstraint.activate([
            viewScreen.topAnchor.constraint(equalTo: view.topAnchor),
            viewScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewScreen.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewScreen.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: Load Repositories
    
    func loadRepositories() {
        interactor?.loadRepositories()
    }
    
    private func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - SwiftRepositoriesDisplayLogic
extension SwiftRepositoriesViewController: SwiftRepositoriesDisplayLogic {
    func displayRepositories(viewModel: SwiftRepositories.LoadRepositories.ViewModel) {
        viewScreen.items = viewModel.items
    }
    
    func displayError(title: String, message: String) {
        showMessage(title: title, message: message)
    }
    
    func toggleLoading(_ bool: Bool) {
        if bool {
            viewScreen.startLoading()
            return
        }
        viewScreen.stopLoading()
    }
}

//MARK: - ViewScreenDelegating
extension SwiftRepositoriesViewController: ViewScreenDelegating {
    func notifyTableViewEnds() {
        interactor?.loadRepositories()
    }
    
    func refreshItems() {
        interactor?.refreshItems()
    }
    
    func didSelectRowAt(repositoryName: String) {
        showMessage(title: "Você selecionou:", message: repositoryName)
    }
}
