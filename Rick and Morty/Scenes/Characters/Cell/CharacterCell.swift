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
        
        image.downloadAndShowImage(imageURL: character.image, placeholder: "image-placeholder")
        name.text = character.name
        statusAndSpecie.text = "\(character.status?.rawValue ?? "") - \(character.species ?? "")"
    }
}


