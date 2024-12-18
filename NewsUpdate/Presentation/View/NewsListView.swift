//
//  ContentView.swift
//  NewsUpdate
//
//  Created by Nagaraju on 17/12/24.
//

import SwiftUI
import CoreData

struct NewsListView: View {
    @ObservedObject var viewModel: NewsViewModel
    
    init(viewModelFactory: ViewModelFactoryProtocol = ViewModelFactroy()) {
        viewModel = viewModelFactory.featchListViewModel()
    }
   
    var body: some View {
        VStack {
            CategoryFilterView(viewModel: viewModel)
            ZStack {
                List(viewModel.articles){ articles in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(articles.title)
                                .font(.headline)
                            if let description = articles.description {
                                Text(description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                            }
                        }
                    }
                }
            }
            
        }.onAppear {
            Task{
                viewModel.featchNews()
            }
        }
        .onChange(of: viewModel.selectedCategory) {
            viewModel.featchNews() // Refetch news when the category changes
        }
      }
   
}
#Preview {
    NewsListView()
}
