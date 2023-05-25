//
//  HomeViewModel+State.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok on 25.05.23.
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
