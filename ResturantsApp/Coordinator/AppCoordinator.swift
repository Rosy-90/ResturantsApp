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
    private let webNavController: UINavigationController
    private let mainVM: ResturantsViewModel
    
    init(tabController: UITabBarController = UITabBarController(),
         resturantNavController: UINavigationController = UINavigationController(),
         webNavigationController: UINavigationController = UINavigationController(),
         mainVM: ResturantsViewModel = ResturantsViewModel()) {
        self.tabController = tabController
        self.resturantNavController = resturantNavController
        self.webNavController = webNavigationController
        self.mainVM = mainVM
    }
    
    func start() {
        self.resturantNavController.delegate = self
        self.resturantNavController.pushViewController(ResturantMainViewController(viewModel: self.mainVM), animated: false)
        self.resturantNavController.tabBarItem = UITabBarItem(title: "lunch", image: UIImage.tabLunch, selectedImage: UIImage.tabLunch?.withTintColor(UIColor.white))
        //self.webNavController.pushViewController(WebViewController(), animated: false)
        self.webNavController.tabBarItem = UITabBarItem(title: "internets", image: UIImage.tabInternet, selectedImage: UIImage.tabInternet?.withTintColor(UIColor.white))
        self.tabController.viewControllers = [self.resturantNavController, self.webNavController]
        
        self.setUpTabBarUI()
    }
    
    private func setUpTabBarUI() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.avenirRegular(for: 10) as Any, NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.avenirRegular(for: 10) as Any, NSAttributedString.Key.foregroundColor: UIColor.tabBarItemNotSelected], for: .normal)
        UITabBar.appearance().barTintColor = UIColor.tabBarColor
        UITabBar.appearance().tintColor = UIColor.white
    }
    
}
