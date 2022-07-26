//
//  LocationCell.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import UIKit

class LocationCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dimensionLabel: UILabel!
    
    static let reuseIdentifier = "LocationCell"
    
    var location: Location.LocationModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupViewCell(location: Location.LocationModel) {
        self.location = location
        
        nameLabel.text = location.name
        typeLabel.text = "(\(location.type ?? ""))"
        dimensionLabel.text = location.dimension
    }
}


