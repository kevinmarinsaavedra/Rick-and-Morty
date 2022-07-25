//
//  EpisodeCell.swift
//  Rick and Morty
//
//  Created by Kevin Marin on 24/7/22.
//

import UIKit

class EpisodeCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    static let reuseIdentifier = "EpisodeCell"
    
    var episode: Episode.EpisodeModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setupViewCell(episode: Episode.EpisodeModel) {
        self.episode = episode
        
        nameLabel.text = episode.name
        airDateLabel.text = episode.airDate
        episodeLabel.text = episode.episode
    }
}


