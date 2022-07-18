//
//  TableViewEmpty.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 18/7/22.
//

import UIKit

class TableViewEmpty: UIView {
    
    //MARK: Vars
    var noDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = RickAndMortyColor.gray
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        return label
    }()
    
    var image: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - Inits
    init(frame: CGRect, title: String, image: UIImage?) {
        super.init(frame: frame)

        noDataLabel.text = title
        
        self.image.image = image
        self.image.tintColor = RickAndMortyColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        self.addSubview(image)
        self.addSubview(noDataLabel)
        
        image.heightAnchor.constraint(equalToConstant: 160).isActive = true
        image.widthAnchor.constraint(equalToConstant: 160).isActive = true
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        noDataLabel.centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        noDataLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 0).isActive = true
    }
}
