//
//  uILabel+Extensions.swift
//  AppStoreSearch
//
//  Created by HanSangmin on 2020/09/21.
//  Copyright © 2020 HanSangmin. All rights reserved.
//

import UIKit

/// Ref: https://stackoverflow.com/questions/3077109/how-to-check-if-uilabel-is-truncated

extension UILabel {

    var isTruncated: Bool {

        guard let labelText = text else {
            return false
        }

        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font ?? UIFont.systemFont(ofSize: 17)],
            context: nil).size

        return labelTextSize.height > 40
    }
}
