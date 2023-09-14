//
//  Model.swift
//  PostApplication
//
//  Created by Mykhailo Zagiko on 14.09.2023.
//

import Foundation

// MARK: - PoastApplication
struct PostApplicationData: Codable {
    let posts: [Post]
}

// MARK: - Post
struct Post: Codable {
    let postID, timeshamp: Int
    let title, previewText: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}
