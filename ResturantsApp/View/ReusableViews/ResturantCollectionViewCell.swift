//
//  ResturantCollectionViewCell.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 28/02/2023.
//

import UIKit

class ResturantCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "\(ResturantCollectionViewCell.self)"
    private var detailViewModel: ResturantDetailViewModel?
    
    private lazy var resturantImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        self.contentView.addSubview(imageView)
        imageView.boundToSuperView()
        return imageView
    }()
    
    private lazy var resturantNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        return label
    }()
    
    private lazy var resturantCategoryLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        self.resturantCategoryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12).isActive = true
        self.resturantCategoryLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12).isActive = true
        self.resturantCategoryLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6).isActive = true
        self.resturantNameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12).isActive = true
        self.resturantNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12).isActive = true
        self.resturantNameLabel.bottomAnchor.constraint(equalTo: self.resturantCategoryLabel.topAnchor, constant: -6).isActive = true
    }
    
    func configure(with viewModel: ResturantDetailViewModel?) {
        guard let viewModel = viewModel else {
            return
        }
        self.detailViewModel = viewModel
        let nameAttributes = [NSAttributedString.Key.font: UIFont.avenirBold(for: 16) as Any, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.resturantNameLabel.attributedText = NSAttributedString(string: viewModel.name, attributes: nameAttributes)
        let categoryAttributes = [NSAttributedString.Key.font: UIFont.avenirBold(for: 12) as Any, NSAttributedString.Key.foregroundColor: UIColor.white]
        self.resturantCategoryLabel.attributedText = NSAttributedString(string: viewModel.category, attributes: categoryAttributes)
        viewModel.imageData { [weak self] (data) in
            if let data = data, let image = UIImage(data: data), let self = self {
                DispatchQueue.main.async {
                    self.resturantImageView.image = image
                    self.contentView.bringSubviewToFront(self.resturantNameLabel)
                    self.contentView.bringSubviewToFront(self.resturantCategoryLabel)
                }
            }
        }
    }
}
