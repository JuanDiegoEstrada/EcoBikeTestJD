//
//  StationsViewModel.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import Foundation
//    @Published var stations: [StationModel] = [StationModel(idStation: "1", nameStation: "una estacion", latitude: -19-123323, longitude: 11.12324, freeBikes: 5, emptySlots: 20)]
class StationsViewModel: ObservableObject {
    @Published var stations: [StationModel] = []
    @Published var errorMessage: String = String()
    
    func fetchGetStation() async {
        
        do {
            print("crear solicitud")
            let request = try RequestService(typeMethod: .get, urlString: "https://api.citybik.es/v2/networks/ecobici")
            let result: Result<DataStationModel, FetchError> = await ServiceNetwork.fetchDataRequest(withRequest: request)
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.stations = Array(success.data.detailStation.prefix(50))
                }
            case .failure(let failure):
                DispatchQueue.main.async {
                    self.errorMessage = failure.localizedDescription
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        }
        
    }
}
