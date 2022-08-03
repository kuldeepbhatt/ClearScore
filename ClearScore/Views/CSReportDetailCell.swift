//
//  CSReportDetailCell.swift
//  ClearScore
//
//  Created by Kuldeep Bhatt on 2022/08/03.
//

import UIKit

class CSReportDetailCell: UITableViewCell {
    @IBOutlet private weak var accountStatusLabel: UILabel!
    @IBOutlet private weak var scoreBandLabel: UILabel!
    @IBOutlet private weak var maxScoreLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var bandDescriptionLabel: UILabel!
    @IBOutlet private weak var nextReportGenerateAfterDaysLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(values: ReportDetailViewModel?) {
        if let accountStatus = values?.accountStatus,
           let scoreBand = values?.scoreBand,
           let maxScore = values?.maxScore,
           let achievedScore = values?.achievedScore,
           let bandDescription = values?.bandDescription,
           let nextReportGenerateAfterDays = values?.nextReportGenerateAfterDays {
            accountStatusLabel.text = "Account status : \(String(describing: accountStatus))"
            scoreBandLabel.text = "Score band : \(String(describing: scoreBand))"
            maxScoreLabel.text = "Max score: \(String(describing: maxScore))"
            scoreLabel.text = "Achieved score : \(String(describing: achievedScore))"
            bandDescriptionLabel.text = "Band description : \(String(describing: bandDescription))"
            nextReportGenerateAfterDaysLabel.text = "Next report generation after : \(String(describing: nextReportGenerateAfterDays)) days"
        }
    }
}
