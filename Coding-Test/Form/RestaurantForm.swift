//
//  RestaurantForm.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/03.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import Foundation

enum RestaurantForm: FormConvertible  {
    
    case restaurants(page: Int)
    
    static let baseURL = "https://beomcheol.github.io/ios-codding-test-resources/restaurants/"
    
    var url: URL {
        switch self {
        case .restaurants(let page):
            return URL(string: RestaurantForm.baseURL+"\(page)/restaurant.json")!
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var parameter: [String : Any]? {
        return nil
    }
    
    var body: Data? {
        return nil
    }
}
