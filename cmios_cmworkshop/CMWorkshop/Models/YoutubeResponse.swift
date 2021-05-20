//
//  YoutubeResponse.swift
//  CMWorkshop
//
//  Created by Codemobiles Golf on 21/7/2563 BE.
//

import Foundation

// MARK: - YoutubeResponse
struct YoutubeResponse: Codable {
    let youtubes: [Youtube]
    let error: Bool
    let errorMsg: String

    enum CodingKeys: String, CodingKey {
        case youtubes, error
        case errorMsg = "error_msg"
    }
}

// MARK: - Youtube
struct Youtube: Codable {
    let id, title, subtitle: String
    let avatarImage: String
    let youtubeImage: String

    enum CodingKeys: String, CodingKey {
        case id, title, subtitle
        case avatarImage = "avatar_image"
        case youtubeImage = "youtube_image"
    }
}
