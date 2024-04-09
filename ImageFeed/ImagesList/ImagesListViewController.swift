//
//  ViewController.swift
//  ImageFeed
//
//  Created by Ilya Kalin on 11.03.2024.
//

import UIKit

class ImagesListViewController: UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
    private let photosName: [String] = Array(0..<20).map{ "\($0)" }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }()
    
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        let likeButton = indexPath.row % 2 == 0 ? cell.likeButton.setImage(UIImage(named: "like_button_on"), for: .normal) : cell.likeButton.setImage(UIImage(named: "like_button_off"), for: .normal)
        
        cell.contentImage?.image = UIImage(named: photosName[indexPath.row]) ?? UIImage()
        cell.dateLabel?.text = dateFormatter.string(from: Date())
        
    }

    override func viewDidLoad() {
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        
        
        
        super.viewDidLoad()
        
    }


}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return 200
        }
        
        let cellWidth = tableView.bounds.width
        let aspectRatio = image.size.width / image.size.height
        let expectedHeight = cellWidth / aspectRatio
        
        return expectedHeight
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imageListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        configCell(for: imageListCell, with: indexPath)
        
        return imageListCell
    }
    
}
