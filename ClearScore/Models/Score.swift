//
//  Score.swift
//  ClearScore
//
//  Created by Kuldeep Bhatt on 2022/08/03.
//

import Foundation

// MARK: - Score
struct Score: Codable {
    let accountIDVStatus: String
    let creditReportInfo: CreditReportInfo
    let dashboardStatus, personaType: String
    let coachingSummary: CoachingSummary
    let augmentedCreditScore: JSONNull?
}

// MARK: - CoachingSummary
struct CoachingSummary: Codable {
    let activeTodo, activeChat: Bool
    let numberOfTodoItems, numberOfCompletedTodoItems: Int
    let selected: Bool
}

// MARK: - CreditReportInfo
struct CreditReportInfo: Codable {
    let score, scoreBand: Int
    let clientRef, status: String
    let maxScoreValue, minScoreValue, monthsSinceLastDefaulted: Int
    let hasEverDefaulted: Bool
    let monthsSinceLastDelinquent: Int
    let hasEverBeenDelinquent: Bool
    let percentageCreditUsed, percentageCreditUsedDirectionFlag, changedScore, currentShortTermDebt: Int
    let currentShortTermNonPromotionalDebt, currentShortTermCreditLimit, currentShortTermCreditUtilisation, changeInShortTermDebt: Int
    let currentLongTermDebt, currentLongTermNonPromotionalDebt: Int
    let currentLongTermCreditLimit, currentLongTermCreditUtilisation: JSONNull?
    let changeInLongTermDebt, numPositiveScoreFactors, numNegativeScoreFactors, equifaxScoreBand: Int
    let equifaxScoreBandDescription: String
    let daysUntilNextReport: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
