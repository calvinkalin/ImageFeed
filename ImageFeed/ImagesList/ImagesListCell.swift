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
    let gradientLayer = CAGradientLayer()

    
    override func awakeFromNib() {
        super.awakeFromNib()
        addGradientLayer()
        
        contentImage.layer.cornerRadius = 10
        contentImage.layer.masksToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = contentImage.bounds
    }
    
    private func addGradientLayer() {
        gradientLayer.colors = [UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 1).cgColor, UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 0).cgColor]
        
        gradientLayer.frame = CGRect(x: 0, y: contentImage.bounds.height + 30, width: contentImage.bounds.width, height: 30)
//        я понимаю, что размеры градиента неверные, но я не знаю какие значения нужно указать. Методом подбора верный результат так и не получил(
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        
        contentImage.layer.addSublayer(gradientLayer)
    }
    
}
