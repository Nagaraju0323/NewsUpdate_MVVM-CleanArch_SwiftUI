//
//  NewsNetworkDataSource.swift
//  NewsUpdate
//
//  Created by Nagaraju on 18/12/24.
//

import Foundation

protocol NewsNetworkDataSource {
    func featchNews(_ category:NewsCategory?) async throws -> [ArticleModel]
}
