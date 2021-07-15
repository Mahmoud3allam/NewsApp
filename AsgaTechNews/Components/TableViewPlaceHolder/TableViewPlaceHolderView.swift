//
//  TableViewPlaceHolderView.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//

import Foundation
import UIKit

class TableViewPlaceHolderView: UIView {
    lazy var noDataImageView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()

    lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        if let font = UIFont(name: FontTypes.semiBold.name, size: 13) {
            label.font = font
        }
        label.textAlignment = .center
        label.textColor = ColorType.mainTextColor.value
        return label
    }()

    lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        if let font = UIFont(name: FontTypes.regularFont.name, size: 10) {
            label.font = font
        }
        label.textAlignment = .center
        label.textColor = ColorType.mainTextColor.value
        return label
    }()

    init(placeHolderText: String) {
        super.init(frame: .zero)
        self.setupTitleLabel()
        self.backgroundColor = .clear
        self.title.text = placeHolderText
    }

    init(placeHolderImage: UIImage = #imageLiteral(resourceName: "ic_no_posts"), title: String = "No Data yet", subTitle: String) {
        super.init(frame: .zero)
        self.noDataImageView.image = placeHolderImage
        self.title.text = title
        self.subTitleLabel.text = subTitle
        self.backgroundColor = .clear
        self.layoutUserInterFaceForFullPlaceHolder()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTitleLabel() {
        self.addSubview(self.title)
        NSLayoutConstraint.activate([
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -23),
            self.title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.title.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }

    private func layoutUserInterFaceForFullPlaceHolder() {
        self.addSubview(self.noDataImageView)
        NSLayoutConstraint.activate([
            self.noDataImageView.heightAnchor.constraint(equalToConstant: 40),
            self.noDataImageView.widthAnchor.constraint(equalToConstant: 34),
            self.noDataImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            self.noDataImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        self.addSubview(self.title)
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.noDataImageView.bottomAnchor, constant: 18),
            self.title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
            self.title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -23),
            self.title.heightAnchor.constraint(equalToConstant: 19)
        ])
        self.addSubview(self.subTitleLabel)
        NSLayoutConstraint.activate([
            self.subTitleLabel.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 8),
            self.subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
}
