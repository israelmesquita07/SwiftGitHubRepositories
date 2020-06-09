//
//  SwiftGitHubRepositoriesViewControllerTests.swift
//  SwiftGitHubRepositoriesTests
//
//  Created by Israel on 09/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import XCTest
@testable import SwiftGitHubRepositories

class SwiftGitHubRepositoriesViewControllerTests: XCTestCase {

    var sut: SwiftRepositoriesViewController!
    var interactorSpy: InteractorSpy!

    override func setUp() {
        sut = SwiftRepositoriesViewController()
    }

    override func tearDown() {
        interactorSpy = nil
        sut = nil
    }

    func testLoadRepositoriesIsCalledInNotifyTableViewEnds() {
        //Arranje
        setupSpies()
        //ACT
        sut.notifyTableViewEnds()
        //Assert
        XCTAssertTrue(interactorSpy.loadRepositoriesCalled, "loadRepositories() should be called when notifyTableViewEnds() is executed from viewController")
    }
    
    func testLoadRepositoriesIsCalledInLoadRepositories() {
        //Arranje
        setupSpies()
        //ACT
        sut.loadRepositories()
        //Assert
        XCTAssertTrue(interactorSpy.loadRepositoriesCalled, "loadRepositories() should be called when loadRepositories() is executed from viewController")
    }
    
    func testRefreshItemsIsCalledInRefreshItems() {
        //Arranje
        setupSpies()
        //ACT
        sut.refreshItems()
        //Assert
        XCTAssertTrue(interactorSpy.refreshItemsCalled, "refreshItems() should be called when refreshItems() is executed from viewController")
    }
    
    func testToggleViewLoadingTrue() {
        //Arranje
        sut.loadView()
        //ACT
        sut.toggleLoading(true)
        //Assert
        XCTAssertFalse(sut.viewScreen.activityIndicator.isHidden, "activityIndicator should be not hidden in viewController loadView()")
    }
    
    func testToggleViewLoadingFalse() {
        //Arranje
        sut.loadView()
        //ACT
        sut.toggleLoading(false)
        //Assert
        XCTAssertTrue(sut.viewScreen.activityIndicator.isHidden, "activityIndicator should be hidden in viewController loadView()")
    }
}

//MARK: - Spies
extension SwiftGitHubRepositoriesViewControllerTests {
    func setupSpies() {
        interactorSpy = InteractorSpy()
        sut.interactor = interactorSpy
    }
}
