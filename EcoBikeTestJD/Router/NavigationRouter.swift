//
//  NavigationRouter.swift
//  EcoBikeTestJD
//
//  Created by Juan Diego on 21/10/24.
//

import Foundation
import SwiftUI

class NavigationRouter: ObservableObject {
    enum Destination: Hashable {
        
        static func == (lhs: NavigationRouter.Destination, rhs: NavigationRouter.Destination) -> Bool {
            return ObjectIdentifier(NavigationRouter.Destination.self) == ObjectIdentifier(NavigationRouter.Destination.self)
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(NavigationRouter.Destination.self))
        }
        
        case login
        case register
        case homelist
        case detail(model: StationModel)
    }
    
    @Published var navPath = NavigationPath()
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigationBack() {
        navPath.removeLast()
    }
    
    func navigationRoot(){
        navPath.removeLast(navPath.count)
    }
}
