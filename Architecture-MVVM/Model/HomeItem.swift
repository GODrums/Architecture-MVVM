//
//  HomeItem.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok on 25.05.23.
//

import Foundation

struct HomeItem: Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String
}
