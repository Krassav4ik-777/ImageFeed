//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by KraSSavchiK on 16.01.2024.

import Foundation
import UIKit

final class  ImagesListCell: UITableViewCell {
    // MARK: - Public Properties
    static let reuseIdentifier = "ImagesListCell"
    
    // MARK: - IB Outlets
    @IBOutlet var cellImage: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
}
