//
//  NSMutableAttributedString+Extension.swift
//  APMallSwift
//
//  Created by HanSangmin on 16/08/2019.
//  Copyright © 2019 HanSangmin. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    func colorForText(textForAttribute: String, withColor color: UIColor) -> NSMutableAttributedString {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        
        return self
    }
    
    func fontForText(textForAttribute: String, withFont font: UIFont) -> NSMutableAttributedString {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        
        return self
    }
    
    func linkForText(textForAttribute: String, withLink link: String) -> NSMutableAttributedString {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        self.addAttribute(NSAttributedString.Key.link, value: link, range: range)
        
        return self
    }
    
    func color(_ color: UIColor) -> NSMutableAttributedString {
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange( location: 0, length: self.string.count ))
        
        return self
    }
    
    func font(_ font: UIFont) -> NSMutableAttributedString {
        self.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange( location: 0, length: self.string.count ))
        
        return self
    }
    
    func lineSpacing(_ spacing:CGFloat, _ label:UILabel ) -> NSMutableAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing // Whatever line spacing you want in points
        paragraphStyle.alignment = label.textAlignment
        paragraphStyle.lineBreakMode = label.lineBreakMode
        self.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSRange(location:0, length:self.length))
        
        return self
    }
    
}
