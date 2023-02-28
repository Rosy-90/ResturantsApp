//
//  ResturantMainViewController.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 27/02/2023.
//

import UIKit

class ResturantMainViewController: UIViewController {
    
    private let mainViewModel: ResturantsViewModel
    
    init(viewModel: ResturantsViewModel = ResturantsViewModel()) {
        self.mainViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainViewModel.launchResturants()
    }
}
