import UIKit
import Kingfisher

protocol ImagesListCellDelegate: AnyObject {
    func imageListCellDidTapLike(
        _ cell: ImagesListCell,
        completion: @escaping (Bool) -> Void
    )
}

final class ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    
    weak var delegate: ImagesListCellDelegate?
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var contentImage: UIImageView!
    
    private let gradientLayer = CAGradientLayer()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        contentImage.kf.cancelDownloadTask()
    }
    
    @IBAction func likeButtonClicked(sender: Any) {
        delegate?.imageListCellDidTapLike(self){ [weak self] isLiked in
            guard let self = self else {
                print("[ImagesListCell]: Error in ImagesListCell")
                return
            }
            self.setImageLike(isLiked: isLiked)
        }
    }
    
    func setImageCell(image: UIImage, date: String, isLiked: Bool ) {
        contentImage.image = image
        dateLabel.text = date
        setImageLike(isLiked: isLiked)
    }
    
    func setImageLike(isLiked: Bool) {
        guard let imageLike = UIImage(named: isLiked ? "like_button_on" : "like_button_off") else { return }
        likeButton.setImage(imageLike, for: .normal)
    }
    
    
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
