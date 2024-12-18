//
//  NewsRepositoryProtocol.swift
//  NewsUpdate
//
//  Created by Nagaraju on 18/12/24.
//


protocol NewsRepositoryProtocol {
    func fetchNewsFromNetwork(category: NewsCategory?) async throws -> [ArticleModel]
}
