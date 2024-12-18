//
//  NewsViewModel.swift
//  NewsUpdate
//
//  Created by Nagaraju on 18/12/24.
//

import SwiftUI
@MainActor
class NewsViewModel:ObservableObject {
    
    @Published var articles:[ArticleModel] = []
    private let newsUseCase: FetchNewsUseCase
    @Published var selectedCategory: NewsCategory = .all
    
    init(newsUseCase: FetchNewsUseCase) {
        self.newsUseCase = newsUseCase
    }
    
    func featchNews() {
        Task {
            do {
                let response = try await newsUseCase.fetchNewsFromNetwork(category: selectedCategory)
                print(response)
                let result = response.filter{ articles in
                    return articles.description != "[Removed]" && articles.title != "[Removed]"
                }
                await MainActor.run {
                    self.articles = result
                }
            }catch {
                print("Error")
            }
        }
    }
    
}
