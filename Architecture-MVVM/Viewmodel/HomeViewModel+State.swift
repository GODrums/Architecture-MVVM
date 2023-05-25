//
//  HomeViewModel+State.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok
//

import Foundation

extension HomeViewModel {
    enum State {
        case idle
        case loading
        case success([HomeItem])
        case error(Error)
    }
}
