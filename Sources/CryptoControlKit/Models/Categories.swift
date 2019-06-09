//
//  File.swift
//
//
//  Created by Joe Blau on 6/8/19.
//

import Foundation

//public struct Categories: Codable {
//    public let analysis: [Article]
//    public let blockchain: [Article]
//    public let exchanges: [Article]
//    public let general: [Article]
//    public let government: [Article]
//    public let ico: [Article]
//    public let mining: [Article]
//}

public enum Category: String {
    case analysis = "analysis"
    case blockchain = "blockchain"
    case exchanges = "exchanges"
    case general = "general"
    case government = "government"
    case mining = "mining"
}
