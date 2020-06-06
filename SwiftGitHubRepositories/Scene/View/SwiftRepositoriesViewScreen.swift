//
//  SwiftRepositoriesViewScreen.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import UIKit

class SwiftRepositoriesViewScreen: UIView {

    var itens: [Item] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    

}


//MARK: - UITableViewDataSource
extension SwiftRepositoriesViewScreen: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//MARK: - UITableViewDelegate
extension SwiftRepositoriesViewScreen: UITableViewDelegate {
    
}
