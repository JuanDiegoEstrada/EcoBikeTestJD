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
        }
        
        .navigationBarBackButtonHidden(true)
        .onAppear {
            Task {
                await viewModel.fetchGetStation()
            }
        }
    }
}

#Preview {
    HomeBikeListView()
}
