//
//  BaseCoordinator.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

protocol BaseCoordinator {
    var navController: UINavigationController? { get set }

    func start() -> UINavigationController?
}


protocol BaseGeneralCoordinator {
    func start(viewController: UIViewController) -> UINavigationController?
}
