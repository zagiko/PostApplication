//
//  Model.swift
//  PostApplication
//
//  Created by Mykhailo Zagiko on 25.09.2023.
//

import Foundation

// MARK: - PoastApplication
struct PostList: Codable {
    let posts: [Post]
}

struct PostDetail: Codable {
    let post: Post
}

// MARK: - Post
struct Post: Codable {
    let postID: Int
    let timeshamp: Int
    let title: String
    let previewText: String?
    let likesCount: Int
    let text: String?
    let postImage: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp
        case title
        case previewText = "preview_text"
        case likesCount = "likes_count"
        case text
        case postImage
        
    }
}
