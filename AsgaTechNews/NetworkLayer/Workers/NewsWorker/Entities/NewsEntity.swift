//
//  NewsEntity.swift
//  AsgaTechNews
//
//  Created by Alchemist on 15/07/2021.
//  Copyright © 2021 AsgaTech. All rights reserved.
//
import Foundation

// MARK: - NewsEntity

struct NewsEntity: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}
