//
//  Item.swift
//  WisdomLeafProject
//
//  Created by Swapnil baranwal on 16/05/23.
//

import Foundation

struct Item: Codable {
    let id: String
    let author: String
    let width,height: Int
    let url,downloadURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
