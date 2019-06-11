//
//  File.swift
//
//
//  Created by Joe Blau on 6/8/19.
//

import Foundation

public struct Category: Codable {
    public let analysis: [ArticleItem]
    public let blockchain: [ArticleItem]
    public let exchanges: [ArticleItem]
    public let general: [ArticleItem]
    public let government: [ArticleItem]
    public let ico: [ArticleItem]
    public let mining: [ArticleItem]
}
