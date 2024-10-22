//
//  StationModel.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import Foundation
struct DataStationModel: Codable {
    let data: dataNetwork
    
    enum CodingKeys: String, CodingKey {
        case data = "network"
    }
    
    struct dataNetwork: Codable {
        let detailStation: [StationModel]
        
        enum CodingKeys: String, CodingKey {
            case detailStation = "stations"
        }
    }
}

struct StationModel : Codable{
    let idStation: String
    let nameStation: String
    let latitude: Double
    let longitude: Double
    let freeBikes: Int
    let emptySlots: Int
    let totalSlotsData: extraData
    
    enum CodingKeys: String, CodingKey {
        case idStation = "id"
        case nameStation = "name"
        case latitude = "latitude"
        case longitude = "longitude"
        case freeBikes = "free_bikes"
        case emptySlots = "empty_slots"
        case totalSlotsData = "extra"
    }
    
    struct extraData: Codable {
        let totalSlots: Int
        
        enum CodingKeys: String, CodingKey {
            case totalSlots = "slots"
        }
    }
}
