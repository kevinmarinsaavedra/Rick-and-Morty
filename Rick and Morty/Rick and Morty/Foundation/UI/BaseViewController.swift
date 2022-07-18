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

class BaseViewController: UIViewController {

    //MARK: VARIABLES
    var activityIndicator: UIActivityIndicatorView!

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

extension BaseViewController: BaseViewControllerDelegate {

    func starLoading() {
        self.activityIndicator.startAnimating()
    }
    
    func stopLoading() {
        activityIndicator.stopAnimating()
    }
}
