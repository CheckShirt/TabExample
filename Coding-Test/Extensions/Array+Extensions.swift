//
//  Array+Extensions.swift
//  AppStoreSearch
//
//  Created by HHanSangmin on 2020/09/17.
//  Copyright © 2020 HanSangmin. All rights reserved.
//

import Foundation

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
