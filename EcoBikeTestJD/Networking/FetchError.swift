//
//  FetchError.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import Foundation

enum FetchError: Error, LocalizedError {
    case codeStatusError(code: Int)
    case requestFailed(description: String)
    case decodingError
    case invalidUrl
    case bodySerializationFailed
    
    var errorDescription: String {
        switch self {
        case .codeStatusError(let code):
            return "Codigo de error: \(code)"
        case .requestFailed(let description):
            return description
        case .decodingError:
            return "Error al decodificar los datos recibidos."
        case .invalidUrl:
            return "Url Invalida"
        case .bodySerializationFailed:
            return "Error al serializar el cuerpo de la solicitud."
        }
    }
    
    static func handleHTTPError(statusCode: Int) -> Bool {
        switch statusCode {
        case 200...299:
            return true
        default:
            return false
        }
    }
}
