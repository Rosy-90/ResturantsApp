//
//  AppCoordinator.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 28/02/2023.
//

import UIKit

class AppCoordinator: NSObject, UINavigationControllerDelegate {
    
    private let tabController: UITabBarController
    private let resturantNavController: UINavigationController
    private let mainVM: ResturantsViewModel
    
    init(tabController: UITabBarController = UITabBarController(),
         resturantNavController: UINavigationController = UINavigationController(),
         mainVM: ResturantsViewModel = ResturantsViewModel()) {
        self.tabController = tabController
        self.resturantNavController = resturantNavController
        self.mainVM = mainVM
    }
    
    func start() {
        self.resturantNavController.delegate = self
        self.resturantNavController.pushViewController(ResturantMainViewController(viewModel: self.mainVM), animated: false)
        self.resturantNavController.tabBarItem = UITabBarItem(title: "lunch", image: UIImage.tabLunch, selectedImage: UIImage.tabLunch?.withTintColor(UIColor.white))
        self.tabController.viewControllers = [self.resturantNavController]
        
        self.setUpTabBarUI()
    }
    
    private func setUpTabBarUI() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.avenirRegular(for: 10) as Any, NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBar.appearance().barTintColor = UIColor.tabBarColor
        UITabBar.appearance().tintColor = UIColor.white
    }
    
}
