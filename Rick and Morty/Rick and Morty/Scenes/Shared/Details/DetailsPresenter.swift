//
//  DetailsPresenter.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import UIKit

protocol DetailsPresenterProtocol {
    //MARK: METHOD
    func fetchTitleView()
    func fetchDetails(id: Int)
    
    //MARK: NAVIGATION
}
