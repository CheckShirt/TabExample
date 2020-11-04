//
//  FormConvertible.swift
//  AppStoreSearch
//
//  Created by CheckShirt on 2020/09/13.
//  Copyright © 2020 한상민. All rights reserved.
//

import Foundation

public protocol FormConvertible {
    
    var url: URL { get }
             
    var httpMethod: HTTPMethod { get }
    
    var headers: [String: String]? { get }
    
    var parameter: [String: Any]? { get }
    
    var body: Data? { get }    
}
