//
//  ViewController.swift
//  ImageFeed
//
//  Created by KraSSavchiK on 28.12.2023.
//

import UIKit

class ImagesListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

}

extension ImagesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ImagesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        
        guard let imagesListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        
        configCell(for: imagesListCell, with: indexPath)
        return imagesListCell
    }
    
    
}

extension ImagesListViewController {
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        
    }
}
