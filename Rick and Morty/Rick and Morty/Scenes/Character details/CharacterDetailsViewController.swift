//
//  CharacterDetailsViewController.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import UIKit

protocol CharacterDetailsViewDelegate: BaseViewControllerDelegate {
    func displayFetchCharacter(viewModel: Character.FetchCharacter.ViewModel)
}

class CharacterDetailsViewController: BaseViewController {

    //MARK: - @IBOutlet VARIABLES
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusAndSpecieLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    //MARK: - VARIABLES
    
    var presenter: CharacterDetailsPresenterProtocol!
    var viewModel = CharacterDetails.ViewModel()
    
    //MARK: - BUILDER
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.fetchCharacter()
    }

    //MARK: - METHOD

    private func setupUI() {
        title = "Character details"
        
        image.downloadAndShowImage(imageURL: viewModel.character?.image, placeholder: "image-placeholder")
        nameLabel.text = viewModel.character?.name
        statusAndSpecieLabel.text = "\(viewModel.character?.status?.rawValue ?? "") - \(viewModel.character?.species ?? "")"
        originLabel.text = viewModel.character?.origin?.name
        locationLabel.text = viewModel.character?.location?.name
        
        addBackBarButton()
    }
}

extension CharacterDetailsViewController: CharacterDetailsViewDelegate {
    
    func displayFetchCharacter(viewModel: Character.FetchCharacter.ViewModel) {
        self.viewModel.character = viewModel.character
    }
}
