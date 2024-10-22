//
//  HomeBikeListView.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import SwiftUI

struct HomeBikeListView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    @StateObject private var viewModel = StationsViewModel()
    
    var body: some View {
        VStack{
            Text("Ubicaciones EcoBicis")
                .font(.title)
                .fontWeight(.semibold)
            List(viewModel.stations, id: \.idStation) { station in
                StationItemView(station: station)
                    .onTapGesture {
                        navigationRouter.navigate(to: .detail(model: station))
                    }
            }
            Button("Cerrar Sesión"){
                SessionUserDefaults.isSession = false
                navigationRouter.navigationRoot()
            }
            .padding()
            .background(Color.yellow)
            .foregroundStyle(.blue)
            .cornerRadius(15)
            .onAppear {
                Task {
                    await viewModel.fetchGetStation()
                }
            }
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomeBikeListView()
}
