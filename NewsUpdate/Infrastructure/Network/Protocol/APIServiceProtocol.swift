//
//  APIServiceProtocol.swift
//  NewsUpdate
//
//  Created by Nagaraju on 17/12/24.
//


protocol APIServiceProtocol  {
    func featchNews(_ category:String?) async throws -> [ArticleModel]
}