//
//  EcoBikeTestJDApp.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      return true
  }
}

@main
struct EcoBikeTestJDApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @ObservedObject var navigationRouter = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationRouter.navPath) {
                Group {
                    if SessionUserDefaults.isSession {
                        HomeBikeListView()
                    } else {
                        ContentView()
                    }
                }
                    .navigationDestination(for: NavigationRouter.Destination.self) { destination in
                        switch destination {
                        case .start:
                            ContentView()
                        case .login:
                            LoginView()
                        case .register:
                            NewUserView()
                        case .homelist:
                            HomeBikeListView()
                        case .detail(let model):
                            DetailBikeView(station: model)
                        }
                    }
            }
            .environmentObject(navigationRouter)
        }
    }
}
