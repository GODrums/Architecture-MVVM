//
//  ApiClient.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok on 25.05.23.
//

import Foundation

public struct ApiClient {
    static func getMockData() async throws -> [ApiData]? {
        sleep(2)
        var dummyData: [ApiData] = [ApiData]()
        for i in 0...20 {
            dummyData.append(ApiData(title: "This is title nr. \(i)", subTitle: "Including a subtitle"))
        }
        return dummyData
    }
}

struct ApiData: Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String
}
