//
//  PhotoInfo.swift
//  Api Project
//
//  Created by Easton Butterfield on 12/6/22.
//

import Foundation
struct PhotoInfo: Codable {
    var title: String
    var url: URL
    var copyright: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case copyright
    }
}
