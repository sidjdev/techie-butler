//
//  Post.swift
//  TechieButler
//
//  Created by Sidharth J Dev on 28/05/24.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
