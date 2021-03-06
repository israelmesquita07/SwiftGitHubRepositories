//
//  SwiftRepositoriesTableViewCell.swift
//  SwiftGitHubRepositories
//
//  Created by Israel on 06/06/20.
//  Copyright © 2020 israel3D. All rights reserved.
//

import UIKit

final class SwiftRepositoriesTableViewCell: UITableViewCell {
    
    private var task: URLSessionTask?
    
    // MARK: - View Code
    
    private lazy var repositoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var repositoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ownerWithStarsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(repositoryLabel)
        contentView.addSubview(ownerWithStarsLabel)
        contentView.addSubview(repositoryImageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            repositoryImageView.heightAnchor.constraint(equalToConstant: 100.0),
            repositoryImageView.widthAnchor.constraint(equalToConstant: 100.0),
            repositoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            repositoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            
            repositoryLabel.leadingAnchor.constraint(equalTo: repositoryImageView.trailingAnchor, constant: 16.0),
            repositoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
            repositoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            repositoryLabel.heightAnchor.constraint(equalToConstant: 34.0),
            
            ownerWithStarsLabel.topAnchor.constraint(equalTo: repositoryLabel.bottomAnchor),
            ownerWithStarsLabel.leadingAnchor.constraint(equalTo: repositoryLabel.leadingAnchor),
            ownerWithStarsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8.0),
            ownerWithStarsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        task?.cancel()
        repositoryImageView.image = nil
    }
    
    func setupCell(repository item: Item) {
        repositoryLabel.text = item.name
        ownerWithStarsLabel.text = "\(item.owner?.login ?? "")\n\(item.stargazersCount ?? 0) estrelas"
        guard let avatarUrl = item.owner?.avatarUrl,
            let urlImage = URL(string: avatarUrl) else { return }
        task = URLSession.shared.dataTask(with: urlImage, completionHandler: { (data, _, error) in
            if error == nil, let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.repositoryImageView.image = image
                }
            }
        })
        task?.resume()
    }
}
