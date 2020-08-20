//
//  Article.swift
//  dns66_final
//
//  Created by Deanna Schaeffer on 5/6/20.
//  Copyright © 2020 Deanna Schaeffer. All rights reserved.
//

import Foundation

struct Article: Codable {
    var headline: Headline
    var snippet: String
    var web_url: String
    var multimedia: [Multimedia]
}

struct Headline: Codable {
    var print_headline: String
}

struct Multimedia: Codable {
    var url: String
}

struct ArticleSearchResponse: Codable {
    var response: Docs
}

struct Docs: Codable {
    var docs: [Article]
}

