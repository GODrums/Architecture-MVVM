//
//  HomeView.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        Text("Home").font(.title)
        Group {
            switch self.viewModel.state {
            case .success:
                HomeView(viewModel: self.viewModel)
            case .error(let error):
                Text(error.localizedDescription)
            default:
                ProgressView()
            }
        }
        .task {
            await viewModel.fetchItems()
        }
    }
}
