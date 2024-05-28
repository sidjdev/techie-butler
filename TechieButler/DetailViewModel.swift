//
//  DetailViewModel.swift
//  TechieButler
//
//  Created by Sidharth J Dev on 28/05/24.
//

import Foundation
import SwiftUI

class DetailViewModel: ObservableObject {
    @Published var post: Post

    init(post: Post) {
        self.post = post
    }
}

