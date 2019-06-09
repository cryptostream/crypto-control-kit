//
//  Details.swift
//  
//
//  Created by Joe Blau on 6/9/19.
//

import Foundation

enum Details {
    case coinDetails(token: String)
    
    var path: String {
        switch self {
        case .coinDetails(let token):
            return "/api/v1/public/details/coin/\(token)"
        }
    }
    
    var model: ResponseModel {
        switch self {
        case .coinDetails: return .coinDetails(DetailsItem.self)
        }
    }
}
