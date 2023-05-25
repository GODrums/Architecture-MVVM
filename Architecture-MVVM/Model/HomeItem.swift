//
//  HomeItem.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok
//

import Foundation

struct HomeItem: Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String
    var link: String
}
