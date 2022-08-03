//
//  TestHelper.swift
//  ClearScoreTests
//
//  Created by Kuldeep Bhatt on 2022/08/03.
//

import Foundation
import Alamofire

class TestHelpers: NSObject {
    
    static func jsonDictionary(from fileName: String) -> Dictionary<AnyHashable, Any>? {
        return json(from: fileName) as? Dictionary<AnyHashable, Any>
    }
    
    static func jsonArray(from fileName: String) -> Array<Dictionary<AnyHashable, Any>>? {
        return json(from: fileName) as? Array<Dictionary<AnyHashable, Any>>
    }
    
    private static func json(from fileName: String) -> Any? {
        guard let jsonData = jsonData(from: fileName) else {
            return nil
        }
        return try! JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves)
    }
    
    static func jsonData(from fileName: String) -> Data? {
        guard let path = Bundle(for:TestHelpers.self).path(forResource: fileName, ofType: "json") else {
            return nil
        }
        return try! Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}
