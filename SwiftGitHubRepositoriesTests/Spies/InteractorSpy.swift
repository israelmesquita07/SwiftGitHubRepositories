//
//  InteractorSpy.swift
//  SwiftGitHubRepositoriesTests
//
//  Created by Israel on 09/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation
@testable import SwiftGitHubRepositories

class InteractorSpy {
    var loadRepositoriesCalled: Bool
    var refreshItemsCalled: Bool
    
    init() {
        loadRepositoriesCalled = false
        refreshItemsCalled = false
    }
}


//MARK: - SwiftRepositoriesBusinessLogic
extension InteractorSpy: SwiftRepositoriesBusinessLogic {
    func loadRepositories() {
        loadRepositoriesCalled = true
    }
    
    func refreshItems() {
        refreshItemsCalled = true
    }
}
