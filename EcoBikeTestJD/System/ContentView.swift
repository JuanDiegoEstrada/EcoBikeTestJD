//
//  ContentView.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    var body: some View {
        ZStack {
            Color.blue
            VStack{
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.white)
                    .padding(.top, 50)
                Text("Eco Bike")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.top, 25)
                Button("Comenzar") {
                    navigationRouter.navigate(to: .login)
                }
                .padding()
                .background(Color.yellow)
                .foregroundStyle(.blue)
                .font(.title2)
                .cornerRadius(15)
                .padding(.top, 100)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
