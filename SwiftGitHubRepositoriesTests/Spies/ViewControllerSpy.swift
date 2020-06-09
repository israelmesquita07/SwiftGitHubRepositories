//
//  ViewControllerSpy.swift
//  SwiftGitHubRepositoriesTests
//
//  Created by Israel on 09/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import SwiftGitHubRepositories

class ViewControllerSpy {
    
    var displayRepositoriesCalled: Bool
    var displayErrorCalled: Bool
    var toggleLoadingCalled: Bool
    
    init() {
        displayRepositoriesCalled = false
        displayErrorCalled = false
        toggleLoadingCalled = false
    }
}

//MARK: - SwiftRepositoriesDisplayLogic
extension ViewControllerSpy: SwiftRepositoriesDisplayLogic {
    func displayRepositories(viewModel: SwiftRepositories.LoadRepositories.ViewModel) {
        displayRepositoriesCalled = true
    }
    
    func displayError(title: String, message: String) {
        displayErrorCalled = true
    }
    
    func toggleLoading(_ bool: Bool) {
        toggleLoadingCalled = true
    }
}
