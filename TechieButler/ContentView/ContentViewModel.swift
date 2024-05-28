//
//  ContentViewModel.swift
//  TechieButler
//
//  Created by Sidharth J Dev on 28/05/24.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var posts: [Post] = []
    private var networkManager = NetworkManager()
    private var currentPage = 1
    var isFetching = false

    func fetchPosts() {
        guard !isFetching else { return }
        isFetching = true

        let params = ["_page": currentPage, "_limit": 10]

        networkManager.performRequest(operation: .getPosts, responseType: [Post].self, params: params) { [weak self] result in
            DispatchQueue.main.async {
                self?.isFetching = false
                switch result {
                case .success(let newPosts):
                    self?.posts.append(contentsOf: newPosts)
                    self?.currentPage += 1
                case .failure(let error):
                    print("Error fetching posts: \(error)")
                }
            }
        }
    }
}
