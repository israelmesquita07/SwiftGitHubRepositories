//
//  SwiftGitHubRepositoriesWorkerTests.swift
//  SwiftGitHubRepositoriesTests
//
//  Created by Israel on 08/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import XCTest
@testable import SwiftGitHubRepositories

class SwiftGitHubRepositoriesWorkerTests: XCTestCase {
    
    var sut: SwiftRepositoriesWorker!
    
    override func setUp() {
        super.setUp()
        sut = SwiftRepositoriesWorker()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testFetchRepositoriesSuccess() {
        //Arranje
        let expectation = XCTestExpectation(description: "repositoriesSuccessExpectation")
        let request = SwiftRepositories.LoadRepositories.Request(page: 1)
        //ACT
        sut.fetchRepositories(request: request) { result in
            switch result {
            case .success(let repositories):
                //Assert
                XCTAssertNotNil(repositories, "repositories should not be nil")
                expectation.fulfill()
            default:
                break
            }
        }
        wait(for: [expectation], timeout: 20.0)
    }
    
    func testFetchRepositoriesError() {
        //Arranje
        let expectation = XCTestExpectation(description: "repositoriesErrorExpectation")
        let request = SwiftRepositories.LoadRepositories.Request(page: 3000)
        //ACT
        sut.fetchRepositories(request: request) { result in
            print(result)
            switch result {
            case.failure(let error):
                //Assert
                XCTAssertNotNil(error, "error should not be nil when page is invalid")
                expectation.fulfill()
            default:
                break
            }
        }
        wait(for: [expectation], timeout: 20.0)
    }
}
