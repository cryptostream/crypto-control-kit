//
//  File.swift
//  
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

public enum ResponseModel {
    // News
    case articles([ArticleItem].Type)
    
    // Reddit
    case reddit([RedditItem].Type)
    
    // Tweets
    case tweets([TweetItem].Type)
    
    // Feed
    case feed([FeedItem].Type)
    
    // Coin Details
    case coinDetails(DetailsItem.Type)


}
