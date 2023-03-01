//
//  ResturantMainViewController.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 27/02/2023.
//

import UIKit

class ResturantMainViewController: UIViewController, UICollectionViewDelegate {
    
    
    private let mainViewModel: ResturantsViewModel
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        collectionView.boundToSuperView()
        collectionView.register(ResturantCollectionViewCell.self, forCellWithReuseIdentifier: ResturantCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    init(viewModel: ResturantsViewModel = ResturantsViewModel()) {
        self.mainViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
        self.mainViewModel.launchResturants()
    }
}

extension ResturantMainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.mainViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ResturantCollectionViewCell.reuseIdentifier, for: indexPath) as? ResturantCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.contentView.backgroundColor = (indexPath.item.isMultiple(of: 2)) ? .red : .blue
        cell.configure(with: self.mainViewModel.resturantDetailViewModel(for: indexPath.item))
        return cell
    }
}

extension ResturantMainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return CGSize(width: self.view.frame.width, height: 180)
        default:
            return CGSize(width: (self.view.frame.width - 5) / 2, height: 180)
        }
    }
    
}
