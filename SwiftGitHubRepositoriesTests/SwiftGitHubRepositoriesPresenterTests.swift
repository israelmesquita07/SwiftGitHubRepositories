//
//  SwiftGitHubRepositoriesPresenterTests.swift
//  SwiftGitHubRepositoriesTests
//
//  Created by Israel on 09/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import XCTest
@testable import SwiftGitHubRepositories

class SwiftGitHubRepositoriesPresenterTests: XCTestCase {
    
    var sut: SwiftRepositoriesPresenter!
    var viewControllerSpy: ViewControllerSpy!

    override func setUp() {
        sut = SwiftRepositoriesPresenter()
    }

    override func tearDown() {
        viewControllerSpy = nil
        sut = nil
    }

    func testDisplayErrorIsCalledInPresentError() {
        //Arranje
        setupSpies()
        //ACT
        sut.presentError(title: "", message: "")
        //Assert
        XCTAssertTrue(viewControllerSpy.displayErrorCalled, "displayErrorCalled() should be called when presentError() is executed from presenter")
    }
    
    func testToggleLoadingIsCalledInToggleLoading() {
        //Arranje
        setupSpies()
        //ACT
        sut.toggleLoading(false)
        //Assert
        XCTAssertTrue(viewControllerSpy.toggleLoadingCalled, "toggleLoading() should be called when toggleLoading() is executed from presenter")
    }
    
    func testDisplayRepositoriesIsCalledInPresentRepositories() {
        //Arranje
        let item = Item(id: 1, name: "Kingfisher", stargazersCount: 10, owner: nil)
        let items = [item]
        let response = SwiftRepositories.LoadRepositories.Response(items: items)
        setupSpies()
        //ACT
        sut.presentRepositories(response: response)
        //Assert
        XCTAssertTrue(viewControllerSpy.displayRepositoriesCalled, "displayRepositories() should be called when presentRepositories() is executed from presenter")
    }
}

//MARK: - Spies
extension SwiftGitHubRepositoriesPresenterTests {
    func setupSpies() {
        viewControllerSpy = ViewControllerSpy()
        sut.viewController = viewControllerSpy
    }
}
