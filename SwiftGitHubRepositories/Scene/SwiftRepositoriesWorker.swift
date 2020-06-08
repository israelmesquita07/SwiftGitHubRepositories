//
//  SwiftRepositoriesWorker.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright (c) 2020 israel3D. All rights reserved.
//

import UIKit

protocol ListRepositoryServicing {
    func fetchRepositories(request: SwiftRepositories.LoadRepositories.Request, completion: @escaping(Result<Repositories, RepositoryError>) -> Void)
}

final class SwiftRepositoriesWorker: ListRepositoryServicing {
    
    func fetchRepositories(request: SwiftRepositories.LoadRepositories.Request, completion: @escaping(Result<Repositories, RepositoryError>) -> Void) {
        
        guard let url = URL(string: "\(Endpoints.urlPage)\(request.page)") else {
            completion(.failure(.invalidUrl))
            return
        }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(.internetFailure))
                }
                return
            }
            do {
                guard let data = data else {
                    DispatchQueue.main.async {
                        completion(.failure(.internetFailure))
                    }
                    return
                }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decoded = try decoder.decode(Repositories.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(decoded))
                }
            } catch let error {
                DispatchQueue.main.async {
                    completion(.failure(.decodeError(error)))
                }
            }
        }
        dataTask.resume()
    }
}
