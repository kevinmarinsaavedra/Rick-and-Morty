//
//  EpisodesViewController.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

protocol EpisodesViewDelegate: BaseViewControllerDelegate {
    func displayFetchEpisodes(viewModel: Episode.FetchEpisodes.ViewModel)
}

class EpisodesViewController: BaseViewController {
    
    //MARK: - @IBOutlet VARIABLES

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - VARIABLES
    
    private struct Constant {
        static let cellNibName = "EpisodeCell"
    }
    
    var presenter: EpisodesPresenterProtocol!
    var viewModel = Episodes.ViewModel()
        
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchEpisodes()
    }

    //MARK: - METHOD

    private func setupUI() {
        title = "Episodes"
        addSearch(target: self)
    }
    
    private func fetchEpisodes(name: String = "") {
        
        let request = Episode.FetchEpisodes.Request(
            parameters: Episode.Parameters(name: name)
        )
        
        self.presenter?.fetchEpisodes(request: request)
    }
    
    private func setupTableView() {
        tableView.register(
            UINib(nibName: Constant.cellNibName, bundle: nil),
            forCellReuseIdentifier: EpisodeCell.reuseIdentifier
        )
    }

}

extension EpisodesViewController: EpisodesViewDelegate {
    
    func displayFetchEpisodes(viewModel: Episode.FetchEpisodes.ViewModel) {
        self.viewModel.episodes = viewModel.episodes
        self.tableView.reloadData()
    }
}

// UITableViewDelegate, UITableViewDataSource
extension EpisodesViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeCell.reuseIdentifier, for: indexPath) as? EpisodeCell else {
            return UITableViewCell()
        }
        
        let episode = viewModel.episodes[indexPath.row]
        
        cell.setupViewCell(episode: episode)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        presenter.navigationDetails(episode: viewModel.episodes[indexPath.row])
    }
}

// BaseSearchControllerDelegate
extension EpisodesViewController: BaseSearchControllerDelegate {
    
    func updateSearch(for searchController: UISearchController) {
        fetchEpisodes(name: searchController.searchBar.text ?? "")
    }
}

