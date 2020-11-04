//
//  Logger.swift
//  AppStoreSearch
//
//  Created by HanSangmin on 03/06/2019.
//  Copyright © 2019 HanSangmin. All rights reserved.
//

import Foundation

class Logger {
    static func debug(_ message: String = "", filePath: String = #file, funcName: String = #function, line: Int = #line) {
        #if DEBUG
        let fileName = sourceFileName(filePath: filePath)
        print("[🔹|\(fileName).\(funcName)-\(line)] - \(message)")
        #endif
    }
    
    static func warn(_ message: String = "", filePath: String = #file, funcName: String = #function, line: Int = #line) {
        #if DEBUG
        let fileName = sourceFileName(filePath: filePath)
        print("[🔸|\(fileName).\(funcName)-\(line)] - \(message)")
        #endif
    }
    
    static func error(_ message: String = "", filePath: String = #file, funcName: String = #function, line: Int = #line) {
        #if DEBUG
        let fileName = sourceFileName(filePath: filePath)
        print("[🔴|\(fileName).\(funcName)-\(line)] - \(message)")
        #endif
    }
    
    private static func sourceFileName(filePath: String) -> String {
        let components = filePath.split(separator: "/")
        guard !components.isEmpty else { return "" }
        
        var fileName = components.last!
        fileName = fileName.split(separator: ".").first!
        
        return String(fileName)
    }
}
