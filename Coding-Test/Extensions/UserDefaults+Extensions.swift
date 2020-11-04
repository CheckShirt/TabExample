//
//  UserDefaults+Extensions.swift
//  Coding-Test
//
//  Created by Sangmin on 2020/11/04.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import Foundation

extension UserDefaults: ObservableObject {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(object)
            set(data, forKey: forKey)
        } catch {
            throw ObjectSavableError.unableToEncode
        }
    }
    
    func setObjects<Object>(_ objects: [Object], forKey: String) where Object: Encodable {
        let encoder = JSONEncoder()
        do {
            let data = objects.map ({ try? encoder.encode($0) })
            set(data, forKey: forKey)
        }
    }

    
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable {
        guard let data = data(forKey: forKey) else { throw ObjectSavableError.noValue }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            throw ObjectSavableError.unableToDecode
        }
    }
    
    func getObjects<Object>(forKey: String, castTo type: Object.Type) -> [Object] where Object: Decodable {
        guard let data = array(forKey: forKey) as? [Data] else { return [] }
        let decoder = JSONDecoder()
        return data.map ({ try! decoder.decode(type, from: $0) })
    }
}

protocol ObjectSavable {
    func setObject<Object>(_ object: Object, forKey: String) throws where Object: Encodable
    func getObject<Object>(forKey: String, castTo type: Object.Type) throws -> Object where Object: Decodable
}

enum ObjectSavableError: String, LocalizedError {
    case unableToEncode = "Unable to encode object into data"
    case noValue = "No data object found for the given key"
    case unableToDecode = "Unable to decode object into given type"
    
    var errorDescription: String? {
        rawValue
    }
}
