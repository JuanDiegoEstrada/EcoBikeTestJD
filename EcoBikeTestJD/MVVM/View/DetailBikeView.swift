//
//  DetailBikeView.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import SwiftUI
import MapKit

struct DetailBikeView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    var station: StationModel
    
    var body: some View {
        ZStack{
            MapView(latitude: station.latitude, longitude: station.longitude)
            VStack{
                Spacer()
                VStack{
                    Text(station.nameStation)
                        .font(.title2)
                        .fontWeight(.semibold)
                    HStack{
                        VStack(alignment: .leading){
                            Text("Lugares vacios: \(station.emptySlots)")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Bicicletas libres: \(station.freeBikes)")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Total de luegares: \(station.totalSlotsData.totalSlots)")
                                .font(.title2)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }.padding()
                }.background(Color.gray.opacity(0.75))
            }
        }
    }
}

//#Preview {
//    DetailBikeView()
//}
