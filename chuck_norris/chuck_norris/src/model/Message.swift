//
//  Category.swift
//  chuck_norris
//
//  Created by Diego Alves Openheimer on 26/09/20.
//  Copyright © 2020 Diego Alves Openheimer. All rights reserved.
//

import Foundation


struct Message: Codable {
    let categories: [String]
    let createdAt: String
    let iconURL: String
    let id: String
    let url: String
    let value: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case categories
        case createdAt = "created_at"
        case iconURL = "icon_url"
        case id
        case updatedAt = "updated_at"
        case url, value
    }
}
