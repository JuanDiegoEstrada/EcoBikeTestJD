//
//  StationItemView.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 22/10/24.
//

import SwiftUI

struct StationItemView: View {
    
    var station: StationModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text(station.nameStation)
                .font(.headline)
            HStack{
                Image(systemName: "bicycle.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(station.freeBikes == 0 ? .red : .green)
                Text("Bicicletas disponibles:")
                Spacer()
                Text("\(station.freeBikes)")
            }
        }
    }
}
