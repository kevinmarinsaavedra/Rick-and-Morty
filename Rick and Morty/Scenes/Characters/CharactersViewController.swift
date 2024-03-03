//
//  CharactersViewController.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 17/7/22.
//

import UIKit

protocol CharactersViewDelegate: BaseViewControllerDelegate {
    func displayFetchCharacters(viewModel: Character.FetchCharacters.ViewModel)
}

class CharactersViewController: BaseViewController {

    //MARK: - @IBOutlet VARIABLES
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - VARIABLES
    
    private struct Constant {
        static let cellNibName = "CharacterCell"
        static let maxItemForWidth: CGFloat = 2
        static let minimumInteritemSpacing: CGFloat = 5
    }
    
    var presenter: CharactersPresenterProtocol!
    var viewModel = Characters.ViewModel()
        
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
        
        presenter.navigationDetails(character: viewModel.characters[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: Constant.minimumInteritemSpacing,
                            left: Constant.minimumInteritemSpacing,
                            bottom: Constant.minimumInteritemSpacing,
                            right: Constant.minimumInteritemSpacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return Constant.minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return Constant.minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxWithForItems = (collectionView.bounds.width - ((Constant.maxItemForWidth + 1) * Constant.minimumInteritemSpacing))
        let maxSizeForItem = maxWithForItems / Constant.maxItemForWidth

        return CGSize(width: maxSizeForItem, height: maxSizeForItem)
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

// BaseSearchControllerDelegate
extension CharactersViewController: BaseSearchControllerDelegate {
    
    func updateSearch(for searchController: UISearchController) {
        fetchCharacters(name: searchController.searchBar.text ?? "")
    }
}
