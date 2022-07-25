//
//  DetailsViewController.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import UIKit

protocol DetailsViewDelegate: BaseViewControllerDelegate {
    func displayFetchDetails(viewModel: DetailsModel.FetchDetails.ViewModel)
    func displayFetchTitleView(title: String)
}

class DetailsViewController: BaseViewController {

    //MARK: - @IBOutlet VARIABLES
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //MARK: - VARIABLES
    
    var presenter: DetailsPresenterProtocol!
    var viewModel = Details.ViewModel()

    //MARK: - LIFECYCLE

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let id = viewModel.id else {
            return
        }
        
        self.presenter?.fetchDetails(id: id)
    }
    
    //MARK: - METHOD

    private func setupUI() {
        presenter?.fetchTitleView()
        addBackBarButton()
    }
}

extension DetailsViewController: DetailsViewDelegate {
    
    func displayFetchTitleView(title: String) {
        self.title = title
    }
    
    func displayFetchDetails(viewModel: DetailsModel.FetchDetails.ViewModel) {
        self.titleLabel.text = viewModel.title
        self.subtitleLabel.text = viewModel.subtitle
        self.descriptionLabel.text = viewModel.description
    }
}
