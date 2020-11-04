//
//  Restaurant.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/03.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    let isAvailablePickup: Bool?
    let logoURL: String?
    let name, deliveryMethod: String?
    let isPhoneOrderAvailable: Bool?
    let reviewCount, ownerReplyCount: Int?
    let sectionTitle: String?
    let reviewAvg: Double?
    let payment: [String]?

    enum CodingKeys: String, CodingKey {
        case isAvailablePickup
        case logoURL = "logoUrl"
        case name, deliveryMethod, isPhoneOrderAvailable, reviewCount, ownerReplyCount, sectionTitle, reviewAvg, payment
    }
}

extension Restaurant: CellPresentable {
        
    var isHiddenAvailablePickup: Bool {
        return isAvailablePickup ?? false
    }
    
    var isHiddenPhoneOrderAvaliable: Bool {
        return isPhoneOrderAvailable ?? false
    }
    
    var isHiddenExpresssBadge: Bool {
        guard let method = deliveryMethod else { return true }
        return method == "od" ? false : true
    }
    
    var isHiddenOwnerReply: Bool {
        guard let replyCount = ownerReplyCount else { return true }
        return replyCount > 0 ? false : true
    }
    
    var isHiddenYogiPayment: Bool {
        guard let payment = payment else { return true }
        return !payment.contains("yogiseo")
    }
    
    var isHiddenOfflinePayment: Bool {
        guard let payment = payment else { return true }
        return !payment.contains("offline")
    }
    
    var restaurantTitle: String {
        return name ?? ""
    }
    
    var restaurantLogo: String? {
        guard let url = logoURL else { return nil }
        return url
    }
    
    var restaurantAvg: String {
        return String(format: "%.1f", reviewAvg ?? 0 as CVarArg)
    }
    
    var restaurantReviewCount: String {
        return "리뷰 \(reviewCount ?? 0)"
    }
    
    var restaurantownerReplyCount: String {
        if isHiddenOwnerReply == false {
            return "사장님 댓글 \(ownerReplyCount ?? 0)"
        }
        return ""
    }
}

protocol CellPresentable {
    
    var isHiddenAvailablePickup: Bool { get }
    
    var isHiddenPhoneOrderAvaliable: Bool { get }
    
    var isHiddenExpresssBadge: Bool { get }
    
    var isHiddenOwnerReply: Bool { get }
    
    var isHiddenYogiPayment: Bool { get }
    
    var isHiddenOfflinePayment: Bool { get }
    
    var restaurantTitle: String { get }
    
    var restaurantLogo: String? { get }
    
    var restaurantAvg: String { get }
    
    var restaurantReviewCount: String { get }
    
    var restaurantownerReplyCount: String { get }
}
