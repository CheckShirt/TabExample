//
//  NotificationName+Extensions.swift
//  AppStoreSearch
//
//  Created by HanSangmin on 2020/09/20.
//  Copyright © 2020 HanSangmin. All rights reserved.
//

import Foundation

extension Notification.Name {
    
    public static let addFavorite = Notification.Name(rawValue: "addFavorite")
    
    public static let removeFavorite = Notification.Name(rawValue: "removeFavorite")
}
