//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 12.03.2024.
//

import UIKit


final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var contentImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentImage.layer.cornerRadius = 10
        contentImage.layer.masksToBounds = true
    }
    
}
