//
//  ListDataSource.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/03.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import UIKit

final class ListDataSource: NSObject {
    var sections: [RestaurantGroup] = []
    var sectionHeaders: [SectionType] = []
    
    private var _favoriteManager = FavoriteManager.shared
}

extension ListDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = sections[safe: section] else { return 0 }
        return section.restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReusableCell(of: RestaurantCell.self, at: indexPath)
        if let section = sections[safe: indexPath.section],
           let restaurant = section.restaurants[safe: indexPath.row] {
            cell.configureView(restaurant, isFavoriate: _favoriteManager.isContain(restaurant))
            cell.actionFavorite = { isFavorite in
                if isFavorite == true {
                    self._favoriteManager.add(restaurant)
                } else {
                    self._favoriteManager.remove(restaurant)
                }
            }
        }
        return cell
    }
}
