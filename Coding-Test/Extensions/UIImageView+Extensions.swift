//
//  UIImageView+Extensions.swift
//  AppStoreSearch
//
//  Created by HanSangmin on 2020/09/19.
//  Copyright © 2020 HanSangmin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(_ url: String) {
        self.image = nil
        self.taskIdentifier = url
        
        if let imageURL = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? url) {
            ImageProvider.load(imageURL) { (result) in
                
                guard self.taskIdentifier == url else { return }
                                
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        self.performTransition(image, completionHandler: nil)
                    }
                case .failure(let error):
                    Logger.error(error.localizedDescription)                    
                }
            }
        }        
    }
    
    private func performTransition(_ image: UIImage, completionHandler: (() -> Void)?) {
        UIView.transition(with: self,
                          duration: 0.2,
                          options: [.allowUserInteraction, .beginFromCurrentState, .transitionCrossDissolve],
                          animations: {
            self.image = image
        }) { (_) in
            completionHandler?()
        }
    }
}

extension UIImageView {
    
    private var taskIdentifier: String? {
        get {
            return getAssociatedObject(self, &taskIdentifierKey)
        }
        set {
            setRetainedAssociatedObject(self, &taskIdentifierKey, newValue)
        }
    }
}

private var taskIdentifierKey: Void?

func getAssociatedObject<T>(_ object: Any, _ key: UnsafeRawPointer) -> T? {
    return objc_getAssociatedObject(object, key) as? T
}

func setRetainedAssociatedObject<T>(_ object: Any, _ key: UnsafeRawPointer, _ value:T) {
    objc_setAssociatedObject(object, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
}

