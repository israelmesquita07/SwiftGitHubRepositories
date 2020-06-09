//
//  SwiftGitHubRepositoriesInteractorTests.swift
//  SwiftGitHubRepositoriesTests
//
//  Created by Israel on 08/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import XCTest
@testable import SwiftGitHubRepositories

class SwiftGitHubRepositoriesInteractorTests: XCTestCase {
    
    var sut: SwiftRepositoriesInteractor!
    var workerSpy: WorkerSpy!
    var presenterSpy: PresenterSpy!

    override func setUp() {
        sut = SwiftRepositoriesInteractor()
    }

    override func tearDown() {
        workerSpy = nil
        presenterSpy = nil
        sut = nil
    }

    func testFetchRepositoriesIsCalledInLoadRepositories() {
        //Arranje
        setupSpies()
        //ACT
        sut.loadRepositories()
        //Assert
        XCTAssertTrue(workerSpy.fetchRepositoriesCalled, "fetchRepositories() should be called when loadRepositories() is executed from interactor")
    }
    
    func testToggleLoadingIsCalledInLoadRepositories() {
        //Arranje
        setupSpies()
        //ACT
        sut.loadRepositories()
        //Assert
        XCTAssertTrue(presenterSpy.toggleLoadingCalled, "toggleLoading() should be called when loadRepositories() is executed from interactor")
    }
    
    func testToggleLoadingIsCalledInRefreshItems() {
        //Arranje
        setupSpies()
        //ACT
        sut.refreshItems()
        //Assert
        XCTAssertTrue(presenterSpy.toggleLoadingCalled, "toggleLoading() should be called when refreshItems() is executed from interactor")
    }
    
    func testPageIsEqualsOneInRefreshItems() {
        //Arranje
        sut.page = 1990
        //ACT
        sut.refreshItems()
        //Assert
        XCTAssertEqual(sut.page, 1, "refreshItems() should set page equals 1")
    }
    
    func testItemsCountIsZeroInRefreshItems() {
        //Arranje
        let items = Item(id: 1, name: "Snapshot", stargazersCount: 10, owner: nil)
        sut.items = [items]
        //ACT
        sut.refreshItems()
        //Assert
        XCTAssertEqual(sut.items.count, 0, "refreshItems() should set items.count equals 0")
    }
}

//MARK: - Spies
extension SwiftGitHubRepositoriesInteractorTests {
    func setupSpies() {
        workerSpy = WorkerSpy()
        sut.worker = workerSpy
        presenterSpy = PresenterSpy()
        sut.presenter = presenterSpy
    }
}
