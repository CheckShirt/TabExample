//
//  UIView+Extensions.swift
//  AppStoreSearch
//
//  Created by HanSangmin on 2020/09/18.
//  Copyright © 2020 HanSangmin. All rights reserved.
//

import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        
        get {
            return .init(cgColor: layer.borderColor ?? CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0))
        }
    }
    
    func preventReuseSubViewsWhereUILabel() {
        for subView in self.subviews where subView.isKind(of: UILabel.self) {
            if let label = subView as? UILabel {
                label.text = nil
            }
        }
    }
    
    func preventReuseSubViewsWhereUIImageView() {
        for subView in self.subviews where subView.isKind(of: UIImageView.self) {
            if let imageView = subView as? UIImageView {
                imageView.image = nil
            }
        }
    }
}
