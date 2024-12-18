//
//  FetchNewsUseCase.swift
//  NewsUpdate
//
//  Created by Nagaraju on 18/12/24.
//

import Foundation
//use Viewmodel task
class FetchNewsUseCase {
    var repository : NewsRepositoryProtocol
    init(repository: NewsRepositoryProtocol) {
        self.repository = repository
    }
    func fetchNewsFromNetwork(category: NewsCategory?) async throws -> [ArticleModel] {
        let response = try await repository.fetchNewsFromNetwork(category: category)
        return response
    }
}
