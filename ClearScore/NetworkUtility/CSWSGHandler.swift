//
//  CSWSGHandler.swift
//  ClearScore
//
//  Created by Kuldeep Bhatt on 2022/08/03.
//

import Foundation
import Alamofire

typealias FetchScoreActivityHandler = (Score?, Error?) -> Void
class WSGHandler {
    static func fetchMemberCreditScoreInfo(with urlString: String?, completion: @escaping FetchScoreActivityHandler) {
        guard let urlString = urlString else {
            return
        }

        AF.request(urlString, headers: nil).responseDecodable(of: Score.self) { response in
            completion(response.value, response.error)
        }
    }
}
