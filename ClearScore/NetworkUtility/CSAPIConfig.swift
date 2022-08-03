//
//  CSAPIConfig.swift
//  ClearScore
//
//  Created by Kuldeep Bhatt on 2022/08/03.
//

import Foundation

class APIConfigHandler {
    static let shared = APIConfigHandler()
    var apiConfig: [NSDictionary]? {
        var dictRoot: NSDictionary?
        if let path = Bundle.main.path(forResource: "APIConfig", ofType: "plist") {
            dictRoot = NSDictionary(contentsOfFile: path)
        }

        if let _ = dictRoot
        {
            let apis:[NSDictionary] = dictRoot?["apis"] as! Array
            return apis
        }
        return nil
    }
}
