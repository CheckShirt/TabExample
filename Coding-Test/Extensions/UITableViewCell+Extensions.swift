//
//  UITableViewCell+Extensions.swift
//  AppStoreSearch
//
//  Created by HanSangmin on 2020/09/20.
//  Copyright © 2020 HanSangmin. All rights reserved.
//

import UIKit

extension UITableViewCell {
         
    func setOpaqueBackground() {
        contentView.alpha = 1.0
        backgroundColor = UIColor.white
        
        for subView in self.subviews where subView.isKind(of: UIImageView.self) {
            subView.alpha = 1.0
            subView.backgroundColor = backgroundColor
        }
    }
}
