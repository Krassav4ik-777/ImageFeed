//
//  ViewController.swift
//  ImageFeed
//
//  Created by KraSSavchiK on 28.12.2023.

import UIKit

final class ImagesListViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Private Properties
    // вызов метода map для преобразования каждого элемента массива чисел в строку
    private let photosName: [String] = Array(0..<20).map{ "\($0)" }
    
    // дата форматер
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        formatter.locale = Locale(identifier: "ru_RU")
        return formatter
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // cвойство типа UIEdgeInsets, которое определяет отступы содержимого внутри контейнера
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    }
    
    // метод реализации нужной картинки
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSingleImage" {
            let viewController = segue.destination as! SingleImageViewController
            let indexPath = sender as! IndexPath
            let image = UIImage(named: photosName[indexPath.row])
            viewController.image = image
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
}

//MARK: - Extensions
// определяет методы, которые необходимо реализовать для работы с данными в таблице
extension ImagesListViewController: UITableViewDataSource {
    // метод должен вернуть количество строк, которые должны быть отображены в указанной секции таблицы
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosName.count
    }
   
    // настройки и возврата ячейки (cell) таблицы для определенной строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // если ячейка доступна для повторного использования, она будет возвращена, иначе будет создана новая ячейка
        let cell = tableView.dequeueReusableCell(withIdentifier: ImagesListCell.reuseIdentifier, for: indexPath)
        // происходит попытка приведения типа полученной ячейки к типу ImagesListCell
        guard let imagesListCell = cell as? ImagesListCell else {
            return UITableViewCell()
        }
        // настраивает содержимое ячейки на основе данных, соответствующих указанному indexPath
        configCell(for: imagesListCell, with: indexPath)
        return imagesListCell
    }
}

// Метод, который настраивает ячейку таблицы с заданным индексом
extension ImagesListViewController {
    func configCell(for cell: ImagesListCell, with indexPath: IndexPath) {
        //пытаемся загрузить изображение из ресурсов проекта по его имени, которое хранится в массиве photosName
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return
        }
        // устанавливаем изображение в ячейку cellImage внутри ячейки таблицы
        cell.cellImage.image = image
        // устанавливаем текущую дату в текст метки dateLabel внутри ячейки
        cell.dateLabel.text = dateFormatter.string(from: Date())

        let isLiked = indexPath.row % 2 == 0
        // выбираем соответствующее изображение для кнопки "лайк" в зависимости от значения переменной isLiked
        let likeImage = isLiked ? UIImage(named: "like_button_off") : UIImage(named: "like_button_on")
        // устанавливаем выбранное изображение для кнопки "лайк" внутри ячейки
        cell.likeButton.setImage(likeImage, for: .normal)
    }
}
// вызывается при выборе определенной строки таблицы
extension ImagesListViewController: UITableViewDelegate {
    // метод реализует обработку события выбора строки в таблице
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowSingleImage", sender: indexPath)
    }

    // используется для определения высоты строки таблицы для определенного индекса
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // создаем объект из имени изображения
        guard let image = UIImage(named: photosName[indexPath.row]) else {
            return 0
        }
        // определяем отступы для изображения внутри ячейки таблицы
        let imageInsets = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        // вычисляем ширину изображения на основе ширины таблицы и отступов
        let imageViewWidth = tableView.bounds.width - imageInsets.left - imageInsets.right
        let imageWidth = image.size.width
        // вычисляем масштаб для изображения
        let scale = imageViewWidth / imageWidth
        // вычисляем высоту ячейки на основе размеров изображения и масштаба
        let cellHeight = image.size.height * scale + imageInsets.top + imageInsets.bottom
        return cellHeight
    }
}
