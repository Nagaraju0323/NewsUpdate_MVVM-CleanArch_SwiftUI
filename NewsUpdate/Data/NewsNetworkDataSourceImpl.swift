//
//  NewsNetworkDataSourceImpl.swift
//  NewsUpdate
//
//  Created by Nagaraju on 18/12/24.
//

class NewsNetworkDataSourceImpl:NewsNetworkDataSource {
    private let apiSerice : APIServiceManager
    init(apiSerice: APIServiceManager) {
        self.apiSerice = apiSerice
    }
    
    func featchNews(_ category: NewsCategory?) async throws -> [ArticleModel] {
        return try await apiSerice.featchNews(category?.rawValue)
    }
}
