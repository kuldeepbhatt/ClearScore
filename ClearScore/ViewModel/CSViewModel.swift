//
//  CSViewModel.swift
//  ClearScore
//
//  Created by Kuldeep Bhatt on 2022/08/03.
//

import Foundation

let kScoreScreenTitle = "Dashboard"
let kUnknownScore = "--"

protocol ScoreViewModelling {
    var title: String { get }
    var scoreAchieved: String { get }
    var totalScore: String { get }
    var progress: Double { get }
}

class ScoreViewModel: ScoreViewModelling {
    var creditScore: Score?

    init(with creditScore: Score? = nil) {
        self.creditScore = creditScore
    }
}


extension ScoreViewModel {
    var title: String {
        return kScoreScreenTitle
    }
    
    var scoreAchieved: String {
        return "\(String(describing: self.creditScore?.creditReportInfo.score ?? 0))"
    }
    
    var progress: Double {
        return Double(self.creditScore?.creditReportInfo.score ?? 0)
    }
    
    var totalScore: String {
        return "\(String(describing: self.creditScore?.creditReportInfo.maxScoreValue ?? 0))"
    }
    
    var unknownScoreAchieved: String {
        return kUnknownScore
    }
    
    var unknownTotalScore: String {
        return kUnknownScore
    }
    
    var creditReportInfo: CreditReportInfo? {
        return self.creditScore?.creditReportInfo
    }
}
