//
//  LocationsViewController.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

protocol LocationsViewDelegate: BaseViewControllerDelegate {
    func displayFetchLocations(viewModel: Location.FetchLocations.ViewModel)
}

class LocationsViewController: BaseViewController {
    
    //MARK: - @IBOutlet VARIABLES

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - VARIABLES
    
    private struct Constant {
        static let cellNibName = "LocationCell"
    }
    
    var presenter: LocationsPresenterProtocol!
    var viewModel = Locations.ViewModel()
    
    //MARK: - BUILDER
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchLocations()
    }

    //MARK: - METHOD

    private func setupUI() {
        title = "Characters"
        addSearch(target: self)
    }
    
    private func fetchLocations(name: String = "") {
        
        let request = Location.FetchLocations.Request(
            parameters: Location.Parameters(name: name)
        )
        
        self.presenter?.fetchLocations(request: request)
    }
    
    private func setupTableView() {
        tableView.register(
            UINib(nibName: Constant.cellNibName, bundle: nil),
            forCellReuseIdentifier: LocationCell.reuseIdentifier
        )
    }

}

extension LocationsViewController: LocationsViewDelegate {
    
    func displayFetchLocations(viewModel: Location.FetchLocations.ViewModel) {
        self.viewModel.locations = viewModel.locations
        self.tableView.reloadData()
    }
}

// UITableViewDelegate, UITableViewDataSource
extension LocationsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.reuseIdentifier, for: indexPath) as? LocationCell else {
            return UITableViewCell()
        }
        
        let location = viewModel.locations[indexPath.row]
        
        cell.setupViewCell(location: location)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        presenter.navigationDetail(location: viewModel.locations[indexPath.row])
    }
}

// BaseSearchControllerDelegate
extension LocationsViewController: BaseSearchControllerDelegate {
    
    func updateSearch(for searchController: UISearchController) {
        fetchLocations(name: searchController.searchBar.text ?? "")
    }
}
