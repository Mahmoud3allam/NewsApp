//
//  StretchyHeaderView.swift
//  AsgaTechNews
//
//  Created by Alchemist on 16/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation
import UIKit

class StretchyTableHeaderView: UIView {
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .clear
        scroll.bounces = true
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()

    lazy var contentView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    lazy var headerContainerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var headerImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .lightGray
        return image
    }()

    var stretchyHeaderHeightConstraints: NSLayoutConstraint?
    var stretchyHeaderHeight: CGFloat = 400 {
        didSet {
            stretchyHeaderHeightConstraints?.constant = stretchyHeaderHeight
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = ColorType.background.value
        self.addViews()
        self.setupStretchyHeaderConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addViews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(contentView)
        self.scrollView.addSubview(self.headerContainerView)
        self.headerContainerView.addSubview(self.headerImageView)
    }

    private func setupStretchyHeaderConstraints() {
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        // Label Constraints
        NSLayoutConstraint.activate([
            self.contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            self.contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 0)
//            self.contentView.heightAnchor.constraint(equalToConstant: 800)
        ])
        stretchyHeaderHeightConstraints = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: self.stretchyHeaderHeight)
        stretchyHeaderHeightConstraints?.isActive = true

        // Header Container Constraints
        let headerContainerViewBottom: NSLayoutConstraint!

        self.headerContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headerContainerView.topAnchor.constraint(equalTo: self.topAnchor),
            self.headerContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.headerContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        headerContainerViewBottom = self.headerContainerView.bottomAnchor.constraint(equalTo: self.contentView.topAnchor, constant: -10)
        headerContainerViewBottom.priority = UILayoutPriority(rawValue: 900)
        headerContainerViewBottom.isActive = true

        // ImageView Constraints
        let imageViewTopConstraint: NSLayoutConstraint!
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.headerImageView.leadingAnchor.constraint(equalTo: self.headerContainerView.leadingAnchor),
            self.headerImageView.trailingAnchor.constraint(equalTo: self.headerContainerView.trailingAnchor),
            self.headerImageView.bottomAnchor.constraint(equalTo: self.headerContainerView.bottomAnchor)
        ])

        imageViewTopConstraint = self.headerImageView.topAnchor.constraint(equalTo: self.topAnchor)
        imageViewTopConstraint.priority = UILayoutPriority(rawValue: 900)
        imageViewTopConstraint.isActive = true
    }
}
