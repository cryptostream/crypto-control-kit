//
//  FeedItem.swift
//
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

public struct FeedItem: Codable {
    public let type: String
    public let tweet: TweetItem?
    public let reddit: RedditItem?
    public let article: ArticleItem?
}
