import UIKit

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var contentImage: UIImageView!
    
    private let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentImage.layer.cornerRadius = 10
        contentImage.layer.masksToBounds = true
        
        let topColor = UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 0)
        let bottomColor = UIColor(red: 26/255, green: 27/255, blue: 34/255, alpha: 0.2)
        gradientLayer.colors = [bottomColor.cgColor, topColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        
        contentImage.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = CGRect(x: 0, y: contentImage.bounds.height - 30, width: contentImage.bounds.width, height: 30)
    }
}
