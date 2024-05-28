//
//  NetworkManager.swift
//  TechieButler
//
//  Created by Sidharth J Dev on 28/05/24.
//

import Foundation

enum NetworkOperation {
    case getPosts

    var endpoint: String {
        switch self {
        case .getPosts:
            return "/posts"
        }
    }

    var httpMethod: String {
        switch self {
        case .getPosts:
            return "GET"
        }
    }
}

class NetworkManager {

    private let baseURL = "https://jsonplaceholder.typicode.com"

    func performRequest<T: Decodable>(operation: NetworkOperation, responseType: T.Type, params: [String: Any]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: baseURL + operation.endpoint) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        // Add query parameters if any
        if let params = params {
            urlComponents.queryItems = params.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }

        guard let url = urlComponents.url else {
            completion(.failure(NSError(domain: "Invalid URL Components", code: -1, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = operation.httpMethod

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(responseType, from: data)
                completion(.success(decodedResponse))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }
        task.resume()
    }
}



