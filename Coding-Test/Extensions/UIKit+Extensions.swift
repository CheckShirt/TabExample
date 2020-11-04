//
//  UIKit+Extensions.swift
//  AppStoreSearch
//
//  Created by HanSangmin on 2020/09/17.
//  Copyright © 2020 HanSangmin. All rights reserved.
//

import UIKit

extension UITableView {
            
    func dequeReusableCell<T>(of cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? T else { fatalError("cell reusable fatalError") }
        return cell
    }

    func register<T>(for type: T.Type = T.self) where T: UITableViewCell {
        register(UINib(nibName: String(describing: T.self), bundle: nil), forCellReuseIdentifier: String(describing: T.self))
    }
}

extension UICollectionView {
           
    func dequeReusableCell<T>(of cellType: T.Type = T.self, at indexPath: IndexPath) -> T where T: UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: cellType), for: indexPath) as? T else { fatalError("cell reusable fatalError") }
        return cell
    }
    
    func register<T>(for type: T.Type = T.self) where T: UICollectionViewCell {
        register(UINib(nibName: String(describing: T.self), bundle: nil), forCellWithReuseIdentifier: String(describing: T.self))
    }
    
}

extension UIStoryboard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
    
    func instantiateViewController<T: UIViewController>(_ viewControllerType: T.Type) -> T {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: viewControllerType.self)) as? T else {
            fatalError("Unexpected view controller type for \(String(describing: viewControllerType.self))")
        }
        
        return viewController
    }
}
