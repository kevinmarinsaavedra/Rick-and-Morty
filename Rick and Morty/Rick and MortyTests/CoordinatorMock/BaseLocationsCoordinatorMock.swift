//
//  BaseLocationsCoordinatorMock.swift
//  Rick and MortyTests
//
//  Created by Kevin Marin on 25/7/22.
//

import UIKit
@testable import Rick_and_Morty

class BaseLocationsCoordinatorMock : BaseLocationsCoordinator {
    
    // SPY
    var navigateIsCalled = false
    // END SPY
    
    var navController: UINavigationController?
    
    func start() -> UINavigationController? {
        return nil
    }
    
    func navigate(_ router: LocationsRouter) {
        navigateIsCalled = true
    }
}
