//
//  UIViewExtension.swift
//  ResturantsApp
//
//  Created by Rosy Patel on 01/03/2023.
//

import UIKit

extension UIView {
    func boundToSuperView(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        guard let superViewGuide = self.superview?.safeAreaLayoutGuide else { fatalError("You forgot to add the view to the view hierarchy!") }
                
        self.topAnchor.constraint(equalTo: superViewGuide.topAnchor, constant: insets.top).isActive = true
        self.leadingAnchor.constraint(equalTo: superViewGuide.leadingAnchor, constant: insets.left).isActive = true
        self.trailingAnchor.constraint(equalTo: superViewGuide.trailingAnchor, constant: -insets.right).isActive = true
        self.bottomAnchor.constraint(equalTo: superViewGuide.bottomAnchor, constant: -insets.bottom).isActive = true
    }
}
