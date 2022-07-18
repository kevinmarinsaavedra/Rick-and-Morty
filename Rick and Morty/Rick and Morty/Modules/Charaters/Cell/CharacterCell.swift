//
//  CharacterCell.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import UIKit
import Kingfisher

class CharacterCell: UICollectionViewCell {
    
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var statusAndSpecie: UILabel!
    
    static let reuseIdentifier = "CharacterCell"
    
    var character: Character.CharacterModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupViewCell(character: Character.CharacterModel) {
        self.character = character
        
        content.borderColor = character.status?.getColor()
        
        downloadAndShowImage(imageURL: character.image)
        name.text = character.name
        statusAndSpecie.text = "\(character.status?.rawValue ?? "") - \(character.species ?? "")"
    }
    
    func downloadAndShowImage(imageURL: String?) {
        let url = URL(string: imageURL ?? "")
        image.kf.indicatorType = .activity
        image.kf.setImage(
            with: url,
            placeholder: UIImage(named: "image-placeholder"),
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


