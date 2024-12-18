//
//  Untitled.swift
//  NewsUpdate
//
//  Created by Nagaraju on 18/12/24.
//

class NewsRepository:NewsRepositoryProtocol{

    var networkDataSource:NewsNetworkDataSource
    init(networkDataSource: NewsNetworkDataSource) {
        self.networkDataSource = networkDataSource
    }
     //News Featch From Network
    func fetchNewsFromNetwork(category: NewsCategory?) async throws -> [ArticleModel] {
        return try await networkDataSource.featchNews(category)
    }
}
