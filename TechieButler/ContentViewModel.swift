//
//  ContentViewModel.swift
//  TechieButler
//
//  Created by Sidharth J Dev on 28/05/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var networkManager = NetworkManager()

    func fetchPosts() {
        networkManager.performRequest(operation: .getPosts, responseType: [Post].self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self?.posts = posts
                case .failure(let error):
                    print("Error fetching posts: \(error)")
                }
            }
        }
    }
}
