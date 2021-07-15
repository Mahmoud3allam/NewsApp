//
//  NewsCell.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit
class ArticleCell: UITableViewCell {
    lazy var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    lazy var articleImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.backgroundColor = .gray
        return image
    }()

    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = ""
        label.font = UIFont(name: FontTypes.regularFont.name, size: 16)
        label.numberOfLines = 0
        label.textColor = ColorType.mainTextColor.value
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.layoutUserInterFace()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterFace() {
        self.addSubViews()
        self.setupContainerViewConstraints()
        self.setupNewsImageViewConstraints()
        self.setupDescriptionLabelConstraints()
    }

    private func addSubViews() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.articleImageView)
        self.containerView.addSubview(self.descriptionLabel)
    }

    private func setupContainerViewConstraints() {
        NSLayoutConstraint.activate([
            self.containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }

    private func setupNewsImageViewConstraints() {
        NSLayoutConstraint.activate([
            self.articleImageView.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0),
            self.articleImageView.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10),
            self.articleImageView.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10),
            self.articleImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    private func setupDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            self.descriptionLabel.topAnchor.constraint(equalTo: self.articleImageView.bottomAnchor, constant: 0),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.articleImageView.leadingAnchor),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.articleImageView.trailingAnchor),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: -10)
        ])
    }
}

extension ArticleCell: ArticleCellView {
    func setData(article: Article) {
        self.descriptionLabel.text = article.title ?? ""
        if let imageUrlString = article.urlToImage {
            if let imageUrl = URL(string: imageUrlString) {
                let placeHolderImage = UIImage(color: .lightGray)
                self.articleImageView.kf.indicatorType = .activity
                self.articleImageView.kf.setImage(with: imageUrl, placeholder: placeHolderImage)
            }
        }
    }
}
