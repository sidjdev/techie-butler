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
            List {
                ForEach(viewModel.posts) { post in
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
                // Load more when reaching the end of the list
                if viewModel.isFetching {
                    ProgressView()
                        .padding()
                } else {
                    Color.clear
                        .onAppear {
                            viewModel.fetchPosts()
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
