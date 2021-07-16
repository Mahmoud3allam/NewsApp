//
//  NewsDetailsContainerView.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class NewsDetailsContainerView: StretchyTableHeaderView {
    var presenter: NewsDetailsPresenterProtocol

    lazy var articleDateLabel: LabelWithInset = {
        let label = LabelWithInset()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.backgroundColor = .red
        if let font = UIFont(name: FontTypes.semiBold.name, size: 15) {
            label.font = font
        }
        label.text = ""
        label.textAlignment = .center
        label.layer.cornerRadius = 12
        label.insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        label.textColor = .white
        return label
    }()

    lazy var articleTitleLabel: LabelWithInset = {
        let label = LabelWithInset()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.backgroundColor = ColorType.background.value.withAlphaComponent(0.4)
        if let font = UIFont(name: FontTypes.boldFont.name, size: 22) {
            label.font = font
        }
        label.text = ""
        label.textAlignment = .left
        label.insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        label.textColor = ColorType.mainTextColor.value
        return label
    }()

    lazy var articleDescriptionLabel: LabelWithInset = {
        let label = LabelWithInset()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        if let font = UIFont(name: FontTypes.regularFont.name, size: 14) {
            label.font = font
        }
        label.text = ""
        label.textAlignment = .left
        label.insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        label.textColor = ColorType.mainTextColor.value
        return label
    }()

    lazy var articleSourceView: DetailsWithHeaderView = {
        var view = DetailsWithHeaderView(title: "Source")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var articleContentView: DetailsWithHeaderView = {
        var view = DetailsWithHeaderView(title: "Content")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var exploreSourceButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Explore", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        button.titleLabel?.font = UIFont(name: FontTypes.boldFont.name, size: 12)
        button.addTarget(self, action: #selector(didTappedExploreButton), for: .touchUpInside)
        return button
    }()

    var onTapExploreButton: ((_ exploreUrl: URL) -> Void)?

    init(presenter: NewsDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.layoutUserInterFace()
    }

    private func layoutUserInterFace() {
        self.addSubViews()
        self.setupArticleDateLabelConstraints()
        self.setupArticleTitleLabelConstraints()
        self.setupArticleDescriptionLabelConstraints()
        self.setupArticleSourceViewConstraints()
        self.setupArticleContentViewConstraints()
        self.setupExploreSourceButtonConstraints()
        self.animateHeaderImage()
        self.animateHeaderContent()
    }

    private func addSubViews() {
        self.scrollView.addSubview(self.articleDateLabel)
        self.scrollView.addSubview(self.articleTitleLabel)
        self.scrollView.addSubview(self.articleDescriptionLabel)
        self.scrollView.addSubview(self.articleSourceView)
        self.scrollView.addSubview(self.articleContentView)
        self.scrollView.addSubview(self.exploreSourceButton)
    }

    private func setupArticleDateLabelConstraints() {
        NSLayoutConstraint.activate([
            self.articleDateLabel.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor, constant: 12),
            self.articleDateLabel.bottomAnchor.constraint(equalTo: self.headerContainerView.bottomAnchor, constant: -12),
            self.articleDateLabel.heightAnchor.constraint(equalToConstant: 30)

        ])
    }

    private func setupArticleTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            self.articleTitleLabel.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor, constant: 12),
            self.articleTitleLabel.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor, constant: -12),
            self.articleTitleLabel.bottomAnchor.constraint(equalTo: self.articleDateLabel.topAnchor, constant: -2),
            self.articleTitleLabel.heightAnchor.constraint(lessThanOrEqualTo: self.headerImageView.heightAnchor, multiplier: 0.5)
        ])
    }

    private func setupArticleDescriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            self.articleDescriptionLabel.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor, constant: 12),
            self.articleDescriptionLabel.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor, constant: -12),
            self.articleDescriptionLabel.topAnchor.constraint(equalTo: self.headerContainerView.bottomAnchor, constant: 10)

        ])
    }

    private func setupArticleSourceViewConstraints() {
        NSLayoutConstraint.activate([
            self.articleSourceView.topAnchor.constraint(equalTo: self.articleDescriptionLabel.bottomAnchor, constant: 10),
            self.articleSourceView.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor, constant: 12),
            self.articleSourceView.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor, constant: -12)
        ])
    }

    private func setupArticleContentViewConstraints() {
        NSLayoutConstraint.activate([
            self.articleContentView.topAnchor.constraint(equalTo: self.articleSourceView.bottomAnchor, constant: 10),
            self.articleContentView.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor, constant: 12),
            self.articleContentView.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor, constant: -12),
            self.articleContentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -30)
        ])
    }

    private func setupExploreSourceButtonConstraints() {
        NSLayoutConstraint.activate([
            self.exploreSourceButton.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor, constant: -12),
            self.exploreSourceButton.bottomAnchor.constraint(equalTo: self.headerContainerView.bottomAnchor, constant: -12),
            self.exploreSourceButton.heightAnchor.constraint(equalToConstant: 30),
            self.exploreSourceButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }

    func animateHeaderImage() {
        self.headerImageView.transform = CGAffineTransform(translationX: 0, y: -400)
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            self.headerImageView.transform = .identity
        }, completion: nil)
    }

    func animateHeaderContent() {
        UIView.animate(withDuration: 0.0, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: [.allowUserInteraction, .curveEaseInOut], animations: {
            self.articleDateLabel.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.exploreSourceButton.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.articleTitleLabel.transform = CGAffineTransform(scaleX: 3, y: 3)

        }) { _ in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.9, options: [.allowUserInteraction, .curveEaseInOut], animations: {
                self.articleDateLabel.transform = .identity
                self.exploreSourceButton.transform = .identity
                self.articleTitleLabel.transform = .identity
            }, completion: nil)
        }
    }

    @objc func didTappedExploreButton() {
        print("Explore Tapped")
        if let url = self.presenter.getSourceUrl() {
            self.onTapExploreButton?(url)
        }
    }

    func setupView(with article: Article) {
        if let imageUrlString = article.urlToImage {
            if let imageUrl = URL(string: imageUrlString) {
                self.headerImageView.kf.indicatorType = .activity
                self.headerImageView.kf.setImage(with: imageUrl)
            }
        }
        if let articlePublishedDate = article.publishedAt {
            let dateToPresent = articlePublishedDate.toDate(format: .isoDateTimeSec)?.toString(dateStyle: .medium, timeStyle: .short)
            self.articleDateLabel.text = dateToPresent
        }
        self.articleTitleLabel.text = article.title ?? ""
        self.articleDescriptionLabel.text = article.articleDescription ?? ""
        self.articleSourceView.details = article.source?.name ?? ""
        self.articleContentView.details = article.content ?? ""
    }
}
