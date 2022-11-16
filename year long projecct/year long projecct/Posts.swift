//
//  Posts.swift
//  year long projecct
//
//  Created by Easton Butterfield on 11/1/22.
//
import UIKit
import Foundation
struct Post {
    let id: UUID = UUID()
    var title: String
    var description: String
    var imageName: UIImage?
    
    static var posts: [Post] = []
}
