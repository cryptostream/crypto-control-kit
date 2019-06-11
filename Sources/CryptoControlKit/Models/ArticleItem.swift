//
//  File.swift
//
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

public struct ArticleItem: Codable {
    public let _id: String
    public let url: String
    public let thumbnail: String?
    public let originalImageUrl: String?
    public let title: String
    public let description: String
    public let hotness: Double
    public let activityHotness: Double
    public let primaryCategory: String
    public let words: Int
    public let similarArticles: [SimliarArticle]
    public let coins: [Coin]
    public let publishedAt: String
}
