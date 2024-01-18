//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by KraSSavchiK on 16.01.2024.
//

import Foundation
import UIKit

final class  ImagesListCell: UITableViewCell {
    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
}
