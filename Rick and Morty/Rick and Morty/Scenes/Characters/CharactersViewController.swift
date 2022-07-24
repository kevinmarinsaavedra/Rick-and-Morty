//
//  CharactersViewController.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit
import Alamofire

protocol CharactersViewDelegate: BaseViewControllerDelegate {
    func displayFetchCharacters(viewModel: Character.FetchCharacters.ViewModel)
}

class CharactersViewController: BaseViewController {

    //MARK: - @IBOutlet VARIABLES
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - VARIABLES
    
    private struct Constant {
        static let cellNibName = "CharacterCell"
        static let widthCell: CGFloat = 180
        static let heightCell: CGFloat = 190
        static let minimumInteritemSpacingForSectionAt: CGFloat = 10
    }
    
    var presenter: CharactersPresenterProtocol!
    var viewModel = Characters.ViewModel()
    
    //MARK: - BUILDER
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCharacters()
    }

    //MARK: - METHOD

    private func setupUI() {
        title = "Characters"
        addSearch(target: self)
    }
    
    private func fetchCharacters(name: String = "") {
        
        let request = Character.FetchCharacters.Request(
            parameters: Character.Parameters(name: name)
        )
        
        self.presenter?.fetchCharacters(request: request)
    }
    
    private func setupCollectionView() {
        collectionView.register(
            UINib(nibName: Constant.cellNibName, bundle: nil),
            forCellWithReuseIdentifier: CharacterCell.reuseIdentifier
        )
    }
}

extension CharactersViewController: CharactersViewDelegate {
    
    func displayFetchCharacters(viewModel: Character.FetchCharacters.ViewModel) {

        self.viewModel.characters = viewModel.characters
        self.collectionView.reloadData()
    }
}

// UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
extension CharactersViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseIdentifier, for: indexPath) as? CharacterCell else {
            fatalError()
        }
        
        let character = viewModel.characters[indexPath.row]

        cell.setupViewCell(character: character)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        presenter.navigationDetail(character: viewModel.characters[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let space = ( collectionView.bounds.width - (Constant.widthCell * 2) ) / 3
        
        return UIEdgeInsets(top: 10, left: space, bottom: 10, right: space)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        let space = ( collectionView.bounds.width - (Constant.widthCell * 2) ) / 3
                
        return space
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            if indexPath.row == viewModel.characters.count - 1 {  //numberofitem count
                updateNextSet()
            }
    }

    func updateNextSet(){
           print("On Completetion")
           //fetchCharacters(name: searchController.searchBar.text ?? "")
    }
}

extension CharactersViewController: BaseSearchControllerDelegate {
    
        func updateSearch(for searchController: UISearchController) {
        fetchCharacters(name: searchController.searchBar.text ?? "")
    }
}
