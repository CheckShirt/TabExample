//
//  ImageStorageManager.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/04.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import UIKit

final class ImageStorageManager {
    
    static let shared = ImageStorageManager()
        
    func getImage(for key: String) -> UIImage? {
        return storage[key]
    }
    
    func setImage(image: UIImage, for key: String) {
        storage[key] = image
    }
    
    func removeAll() {
        storage.removeAll()
    }
    
    func removeObject(for key: String) {
        storage.remove(for: key)
    }
    
    private let session = Session.shared
    private let storage: HashImageStorage = .init()
}

public protocol ImageStorage {
    
    func remove(for key: String)
    
    func removeAll()
}
