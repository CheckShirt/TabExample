//
//  String+Extensions.swift
//  AppStoreSearch
//
//  Created by HanSangmin on 2020/09/18.
//  Copyright © 2020 HanSangmin. All rights reserved.
//

import Foundation

extension String {
        
    func getFirstMatchRange(in fullWord: String) -> NSRange? {
        let fullRange = NSRange(location: 0, length: fullWord.endIndex.utf16Offset(in: fullWord))
        do {
            let regex = try NSRegularExpression(pattern: self, options: [])
            let firstMatchRange = regex.rangeOfFirstMatch(in: fullWord, options: [], range: fullRange)
            return firstMatchRange
        } catch { }
        return nil
    }
}
