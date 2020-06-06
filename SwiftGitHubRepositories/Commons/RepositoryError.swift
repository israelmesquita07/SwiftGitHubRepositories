//
//  RepositoryError.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import Foundation

enum RepositoryError: Error {
    case invalidUrl
    case internetFailure
    case decodeError(Error)
}
