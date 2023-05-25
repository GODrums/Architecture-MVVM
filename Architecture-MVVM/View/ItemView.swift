//
//  ItemView.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok
//

import SwiftUI

struct ItemView: View {
    var item: HomeItem
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white)
                .shadow(radius: 5)
            VStack {
                Text(item.title)
                    .font(.title)
                    .foregroundColor(.black)
                Text(item.subTitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                if item.link.count > 0 {
                    Text(item.link)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
    }
}
