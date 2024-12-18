//
//  NewsCategory.swift
//  NewsUpdate
//
//  Created by Nagaraju on 17/12/24.
//


enum NewsCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case business = "Business"
    case entertainment = "Entertainment"
    case health = "Health"
    case science = "Science"
    case sports = "Sports"
    case technology = "Technology"
    var id: String { self.rawValue }
}
