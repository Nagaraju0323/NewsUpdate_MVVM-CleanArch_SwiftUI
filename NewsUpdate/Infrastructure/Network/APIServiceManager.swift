//
//  APIServiceManager.swift
//  NewsUpdate
//
//  Created by Nagaraju on 17/12/24.
//

import Foundation
import SwiftUI

class APIServiceManager:APIServiceProtocol {
    
    var NetworkManager: NetworkManager
    
    init(NetworkManager: NetworkManager) {
        self.NetworkManager = NetworkManager
    }
    func featchNews(_ category:String?) async throws -> [ArticleModel] {
        var queryItems = [URLQueryItem(name: "country", value: "us")]
        if let category = category, !category.isEmpty, category != "All" {
            queryItems.append(URLQueryItem(name: "category", value: category))
        }
        let endpoint = Endpoint.createGETEndpoint(path: "/top-headlines", queryItems: queryItems)
        do {
            let result:NewsResponse = try await NetworkManager.featchReqest(endpoint)
            return result.articles
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.unknown(error)
        }
    }
}
