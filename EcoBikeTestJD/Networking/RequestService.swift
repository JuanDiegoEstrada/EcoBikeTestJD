//
//  RequestService.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import Foundation
struct RequestService {
    var method : String?
    var url: URL
    var headers: [String: String]
    var body: Data?
    
    enum ContentType: String {
        case json = "application/json"
        case urlEncoded = "application/x-www-form-urlencoded"
    }
    
    enum MethodType: String {
        case post = "POST"
        case get = "GET"
    }
    
    public init(typeMethod: MethodType, urlString: String, headers: [String: String] = [:], bodyDict: [String: Any] = [:], contentType: ContentType = .json) throws {
        self.method = typeMethod.rawValue
        
        guard let url = URL(string: urlString) else {
            throw FetchError.invalidUrl
        }
        
        self.url = url
        self.headers = headers
        self.headers["Content-Type"] = contentType.rawValue
        
        if !bodyDict.isEmpty {
            switch contentType {
            case .json:
                do {
                    let bodyData = try JSONSerialization.data(withJSONObject: bodyDict, options: [])
                    self.body = bodyData
                } catch {
                    throw FetchError.bodySerializationFailed
                }
            case .urlEncoded:
                let bodyString = bodyDict.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
                guard let bodyData = bodyString.data(using: .utf8) else {
                    throw FetchError.bodySerializationFailed
                }
                self.body = bodyData
            }
        } else {
            self.body = nil
        }
    }
}
