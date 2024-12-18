//
//  Welcome.swift
//  NewsUpdate
//
//  Created by Nagaraju on 17/12/24.
//

import Foundation

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleModel]
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
struct ArticleModel: Codable, Identifiable {
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    var isBookmarked: Bool = false
    let publishedAt: String
    var id: String {
        title + publishedAt
    }

    // Codable keys to ensure proper encoding/decoding
    enum CodingKeys: String, CodingKey {
        case title, description, url, urlToImage, publishedAt
    }
}
