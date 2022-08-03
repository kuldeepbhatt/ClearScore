//
//  CSDataProvider.swift
//  ClearScore
//
//  Created by Kuldeep Bhatt on 2022/08/03.
//

import Foundation
class DataProvider: NSObject {
    static func performMembersCreditScoreRequest(completion: @escaping FetchScoreActivityHandler) {
        let kCreditScoreAPI = "creditScoreUrl"
        guard let crediScoreAPIConfig = APIConfigHandler.shared.apiConfig?.filter({ config in
            return config.value(forKey: kCreditScoreAPI) != nil
        }).first else { return }
        let urlString = crediScoreAPIConfig.value(forKey: kCreditScoreAPI) as? String
        WSGHandler.fetchMemberCreditScoreInfo(with: urlString, completion: completion)
    }
}
