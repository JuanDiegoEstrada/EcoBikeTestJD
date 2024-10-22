//
//  ServiceNetwork.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import Foundation
struct ServiceNetwork {
    static func fetchDataRequest<T: Decodable>(withRequest request: RequestService) async -> Result<T, FetchError> {
        var urlRequest = URLRequest(url: request.url)
        urlRequest.httpMethod = request.method
        urlRequest.allHTTPHeaderFields = request.headers
        urlRequest.httpBody = request.body
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.requestFailed(description: "Fallo al obtener el contendio de la respuesta"))
            }
            
            if FetchError.handleHTTPError(statusCode: httpResponse.statusCode) {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    return .success(decodedData)
                } catch {
                    return .failure(.decodingError)
                }
            } else {
                return .failure(.codeStatusError(code: httpResponse.statusCode))
            }
        } catch {
            return .failure(.decodingError)
        }
    }

}
