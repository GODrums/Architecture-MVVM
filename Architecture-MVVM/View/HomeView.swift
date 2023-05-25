//
//  HomeView.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(spacing: 20) {
                ForEach(viewModel.homeItems) {
                    ItemView(item: $0)
                }
            }
        }
        .padding()
    }
}
