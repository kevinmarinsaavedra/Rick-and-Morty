//
//  UIImageView.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 19/7/22.
//

import UIKit

extension UIImageView {
    
    func downloadAndShowImage(imageURL: String?, placeholder: String) {
        let url = URL(string: imageURL ?? "")
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: UIImage(named: placeholder),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
