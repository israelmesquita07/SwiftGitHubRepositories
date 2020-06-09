//
//  PresenterSpy.swift
//  SwiftGitHubRepositoriesTests
//
//  Created by Israel on 09/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import SwiftGitHubRepositories

class PresenterSpy {
    var presentRepositoriesCalled: Bool
    var presentErrorCalled: Bool
    var toggleLoadingCalled: Bool
    
    init() {
        presentRepositoriesCalled = false
        presentErrorCalled = false
        toggleLoadingCalled = false
    }
}


//MARK: - SwiftRepositoriesPresentationLogic
extension PresenterSpy: SwiftRepositoriesPresentationLogic {
    func presentRepositories(response: SwiftRepositories.LoadRepositories.Response) {
        presentRepositoriesCalled = true
    }
    
    func presentError(title: String, message: String) {
        presentErrorCalled = true
    }
    
    func toggleLoading(_ bool: Bool) {
        toggleLoadingCalled = true
    } 
}
