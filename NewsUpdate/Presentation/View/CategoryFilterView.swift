//
//  CategoryFilterView.swift
//  NewsUpdate
//
//  Created by Nagaraju on 18/12/24.
//

import SwiftUI

struct CategoryFilterView:View {
    @ObservedObject var viewModel:NewsViewModel
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(NewsCategory.allCases) { newlist in
                    Text(newlist.rawValue)
                        .frame(height:15)
                        .padding()
                        .background(in: RoundedRectangle(cornerRadius: 10))
                        .backgroundStyle(viewModel.selectedCategory == newlist ? Color.blue : Color.brown)
                    
                    
//                        .background(viewModel.selectedCategory == newlist ? Color.blue : Color.gray)
//                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .onTapGesture {
                            viewModel.selectedCategory = newlist
                            viewModel.featchNews()
                        }
                }
            }
        }
    }
}




