//
//  FavoriteService.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/04.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import Foundation

class FavoriteService: Service {
    
    func reload(_ page: Int,
                success: @escaping ([RestaurantGroup]) -> Void,
                failure: @escaping (Error) -> Void) {
        success(FavoriteManager.shared.sections)
    }
}
