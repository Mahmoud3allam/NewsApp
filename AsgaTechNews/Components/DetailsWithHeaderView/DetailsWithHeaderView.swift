//
//  DetailsWithHeaderView.swift
//  AsgaTechNews
//
//  Created by Alchemist on 16/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation
import UIKit

class DetailsWithHeaderView: UIView {
    lazy var titleLabel: LabelWithInset = {
        let label = LabelWithInset()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        if let font = UIFont(name: FontTypes.boldFont.name, size: 16) {
            label.font = font
        }
        label.text = ""
        label.textAlignment = .left
        label.insets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        label.textColor = .red
        return label
    }()

    lazy var detailsLabel: LabelWithInset = {
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

    var details: String? {
        didSet {
            self.detailsLabel.text = details
        }
    }

    init(title: String?) {
        super.init(frame: .zero)
        self.titleLabel.text = title
        self.layoutUserInterFace()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubViews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.detailsLabel)
    }

    private func layoutUserInterFace() {
        self.addSubViews()
        self.setupTitleLabelConstraints()
        self.setupDetailsLabelConstraints()
    }

    private func setupTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    private func setupDetailsLabelConstraints() {
        NSLayoutConstraint.activate([
            self.detailsLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 0),
            self.detailsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.detailsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.detailsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}
