//
//  ContentView.swift
//  TechieButler
//
//  Created by Sidharth J Dev on 28/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.posts) { post in
                NavigationLink(destination: DetailView(viewModel: DetailViewModel(post: post))) {
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.headline)
                        Text(post.body)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Posts")
            .onAppear {
                viewModel.fetchPosts()
            }
        }
    }
}
#Preview {
    ContentView()
}
