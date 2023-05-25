//
//  ApiClient.swift
//  Architecture-MVVM
//
//  Created by Armin Stanitzok
//

import Foundation

public struct ApiClient {
    static func getMockData() async throws -> [ApiData]? {
        sleep(2)
        var dummyData: [ApiData] = [ApiData]()
        for i in 0...20 {
            dummyData.append(ApiData(id: UUID().hashValue, title: "This is title nr. \(i)", subTitle: "Including a subtitle"))
        }
        return dummyData
    }
    
    static func getItems() async throws -> [ApiData] {
        let data = try await Self.request()
        let decoder = JSONDecoder()
        return try decoder.decode([ApiData].self, from: data)
    }
    
    private static func request() async throws -> Data {

        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.csgostonks.online"
        components.path = "/architecture-data"

        guard let url = components.url else {
            throw NSError()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.cachePolicy = .reloadIgnoringLocalCacheData

        if let cached = URLCache.shared.cachedResponse(for: urlRequest) {
            return cached.data
        } else {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard
                let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode)
            else {
                throw NSError()
            }

            let cachedURLResponse = CachedURLResponse(
                response: response,
                data: data,
                storagePolicy: .allowedInMemoryOnly
            )
            URLCache.shared.storeCachedResponse(cachedURLResponse, for: urlRequest)

            return data
        }
    }
}

struct ApiData: Decodable {
    var id: Int
    var title: String
    var subTitle: String
    
}
