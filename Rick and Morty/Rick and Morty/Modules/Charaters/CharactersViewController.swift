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
        self.presenter?.fetchCharacters()
    }

    //MARK: - METHOD

    private func setupUI() {
        title = "Characters"
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
}
