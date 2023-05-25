//
//  HomeViewModel.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var state: State = .idle
    
    var homeItems: [HomeItem] {
        guard case .success(let data) = self.state else {
            return []
        }
        return data
    }

    func fetchItems() async {
        switch self.state {
        case .idle, .error:
            do {
                self.state = .loading
                let data = try await Self._fetchServerItems()
                self.state = .success(data)
            } catch {
                if error is CancellationError {
                    return
                }
                self.state = .error(error)
            }
        case .loading:
            return
        case .success:
            if let data = try? await Self._fetchServerItems() {
                self.state = .success(data)
            }
        }
    }
    
    private static func _fetchItems() async throws -> [HomeItem] {
        let data = try? await ApiClient.getMockData()
        return data?.map({ HomeItem(
            title: $0.title,
            subTitle: $0.subTitle,
            link: ""
        )}) ?? []
    }
    
    private static func _fetchServerItems() async throws -> [HomeItem] {
        let data = try? await ApiClient.getItems()
        return data?.map({ HomeItem(
            title: $0.title,
            subTitle: $0.subTitle,
            link: $0.link
        )}) ?? []
    }
}
