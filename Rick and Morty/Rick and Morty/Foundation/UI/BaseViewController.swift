//
//  BaseViewController.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

protocol BaseViewControllerDelegate: UIViewController {
    func starLoading()
    func stopLoading()
}

protocol BaseSearchControllerDelegate: UIViewController {
    func updateSearch(for searchController: UISearchController)
}

class BaseViewController: UIViewController {

    //MARK: VARIABLES
    var searchDelegate: BaseSearchControllerDelegate?
    
    var activityIndicator: UIActivityIndicatorView!
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.delegate = self
        
        search.hidesNavigationBarDuringPresentation = false
        search.obscuresBackgroundDuringPresentation = false
        
        search.searchBar.placeholder = "Search"
        search.searchBar.backgroundColor = RickAndMortyColor.black
        search.searchBar.searchTextField.backgroundColor = RickAndMortyColor.white
        search.searchBar.searchTextField.tintColor = RickAndMortyColor.gray

        return search
    }()
    
    //MARK: METHOD

    func addSearch(target: BaseSearchControllerDelegate){
        searchDelegate = target
        navigationItem.searchController = searchController
        navigationItem.searchController?.automaticallyShowsScopeBar = true
    }
    
    func addBackBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward"),
            style: .plain,
            target: self,
            action: #selector(didTapBack)
        )
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension BaseViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
        self.searchDelegate?.updateSearch(for: searchController)
    }
}

extension BaseViewController: BaseViewControllerDelegate {

    func starLoading() {
        self.activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        self.activityIndicator.stopAnimating()
    }
}
