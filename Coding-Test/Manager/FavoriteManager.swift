//
//  FavoriteManager.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/04.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import Foundation

final class FavoriteManager {

    static let shared = FavoriteManager()
    
    var sections: [RestaurantGroup] {
        var sections: [RestaurantGroup] = []
        
        let group = Dictionary(grouping: restaurants) { (rest) -> SectionType in
            return SectionType(rawValue: rest.sectionTitle ?? "") ?? .enrolled
        }
        
        sections.append(contentsOf: group.map ({
            RestaurantGroup(sectionType: $0.key, restaurants: $0.value)
        }))
        
        sections.sort { (lhs, rhs) -> Bool in
            return lhs.sectionType > rhs.sectionType
        }
        
        return sections
    }
    
    func add(_ restaurant: Restaurant) {
        var restaurants = self.restaurants
        restaurants = restaurants.filter { $0.name != restaurant.name }
        restaurants.append(restaurant)
        
        UserDefaults.standard.setObjects(restaurants, forKey: FavoriteManager.favoriteKey)
        NotificationCenter.default.post(name: .addFavorite, object: nil)
    }
    
    func remove(_ restaurant: Restaurant) {
        guard isContain(restaurant) else { return }
        
        var restaurants = self.restaurants
        restaurants = restaurants.filter { $0.name != restaurant.name }
        UserDefaults.standard.setObjects(restaurants, forKey: FavoriteManager.favoriteKey)
        NotificationCenter.default.post(name: .removeFavorite, object: nil)
    }
    
    func isContain(_ restaurant: Restaurant) -> Bool {
        return restaurants.contains() { $0.name == restaurant.name }
    }
        
    private var restaurants: [Restaurant] {
        return UserDefaults.standard.getObjects(forKey: FavoriteManager.favoriteKey, castTo: Restaurant.self)
    }
    
    private static let favoriteKey = "favoriteKey"

}
