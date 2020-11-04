//
//  SectionType.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/04.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import Foundation

enum SectionType: String, Comparable {
    
    static func < (lhs: SectionType, rhs: SectionType) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
        
    case townPlus = "우리동네 플러스"
    
    case redWeek = "슈퍼레드위크 추천"
    
    case enrolled = "요기요 등록 음식점"
        
}
