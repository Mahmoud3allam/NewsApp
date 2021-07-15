//
//  NewsDetailsContainerView.swift
//  AsgaTechNews
//
//  Created Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
// @Mahmoud Allam Templete ^_^
import UIKit
class NewsDetailsContainerView: UIView {
    var presenter: NewsDetailsPresenterProtocol

    init(presenter: NewsDetailsPresenterProtocol) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.layoutUserInterFace()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutUserInterFace() {
        self.addSubViews()
    }

    private func addSubViews() {}
}
