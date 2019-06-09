//
//  File.swift
//
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

public struct TweetItem: Codable {
    public let _id: String
    public let text: String
    public let username: String
    public let id: String
    public let publishedAt: Date
    public let isRetweeted: Bool
    public let retweetCount: Int
    public let favouriteCount: Int
    public let links: [String]
    public let hashtags: [String]
    public let mentions: [String]
    public let symbols: [String]
}
