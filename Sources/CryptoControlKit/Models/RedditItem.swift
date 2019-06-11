//
//  File.swift
//
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

public struct RedditItem: Codable {
    public let _id: String
    public let isSelf: Bool
    public let score: Double
    public let comments: Int
    public let upvotes: Int
    public let downvotes: Int
    public let description: String
    public let id: String
    public let publishedAt: String
    public let subreddit: String
    public let title: String
    public let url: String
}
