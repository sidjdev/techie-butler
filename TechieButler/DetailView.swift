//
//  DetailView.swift
//  TechieButler
//
//  Created by Sidharth J Dev on 28/05/24.
//

import SwiftUI

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel: DetailViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.post.title)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(viewModel.post.body)
                .font(.body)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle("Post Details")
    }
}


