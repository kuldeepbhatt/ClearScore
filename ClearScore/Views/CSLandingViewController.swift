//
//  ViewController.swift
//  ClearScore
//
//  Created by Kuldeep Bhatt on 2022/08/02.
//

import UIKit
import MKRingProgressView

class CSLandingViewController: UIViewController {
    @IBOutlet private weak var headerTitleLabel: UILabel!
    @IBOutlet private weak var achievedScoreLabel: UILabel!
    @IBOutlet private weak var totalScoreLabel: UILabel!
    @IBOutlet private weak var progressRingView: RingProgressView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    private var viewModel: ScoreViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

extension CSLandingViewController {
    private func performCreditScoreFetch() {
        //Put loading indicator here...
        showActivityIndicator()
        DataProvider.performMembersCreditScoreRequest { [weak self] scoreReport, error in
            self?.dismissIndicator()
            if error == nil {
                //success - populate score report
                self?.viewModel = ScoreViewModel(with: scoreReport)
                self?.populateReport()
            } else {
                //fallback - populate error case
                self?.populateError()
            }
        }
    }
}

private extension CSLandingViewController {
    func setUp() {
        self.title = self.viewModel?.title
        setUpStyle()
        addTapGestureToRingView()
        performCreditScoreFetch()
    }

    func setUpStyle() {
        achievedScoreLabel.font = UIFont(name: "HelveticaNeue", size: 40.0)
        totalScoreLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
        headerTitleLabel.font = UIFont(name: "HelveticaNeue", size: 17.0)
        configureRingProgressViewStyling()
    }
    
    func addTapGestureToRingView() {
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(navigateToReportDetails))
        //gesture.delegate = self
        progressRingView.addGestureRecognizer(gesture)
    }
}

private extension CSLandingViewController {
    func populateReport() {
        DispatchQueue.main.async{
            self.achievedScoreLabel.text = self.viewModel?.scoreAchieved
            if let totalScore = self.viewModel?.totalScore {
                self.totalScoreLabel.text = String(format: "out of \(totalScore)")
            }
            self.populateRing(with: self.viewModel?.progress)
        }
    }
    
    func populateError() {
        self.achievedScoreLabel.text = self.viewModel?.unknownScoreAchieved
        self.totalScoreLabel.text = self.viewModel?.unknownTotalScore
        showError()
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error!", message: "Something went wrong", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Nevermind!", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

private extension CSLandingViewController {
    func configureRingProgressViewStyling() {
        progressRingView.ringWidth = 10.0
        progressRingView.shadowOpacity = 0
        progressRingView.startColor = .orange
        progressRingView.endColor = .white
        progressRingView.backgroundRingColor = .white
        progressRingView.progress = 0.0
    }
    
    func populateRing(with progress: Double?) {
        progressRingView.progress = progress ?? 0.0
    }
}

extension CSLandingViewController {
    @objc func navigateToReportDetails() {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        guard let detailsContainer = storyBoard.instantiateViewController(withIdentifier: "detailViewController") as? CSDetailViewController else { return }
        detailsContainer.setUp(with: .init(accountStatus: self.viewModel?.creditScore?.accountIDVStatus, scoreBand: self.viewModel?.creditReportInfo?.scoreBand, maxScore: self.viewModel?.creditReportInfo?.maxScoreValue, achievedScore: self.viewModel?.creditReportInfo?.score, bandDescription: self.viewModel?.creditReportInfo?.equifaxScoreBandDescription, nextReportGenerateAfterDays: self.viewModel?.creditReportInfo?.daysUntilNextReport))
        self.navigationController?.pushViewController(detailsContainer, animated: true)
    }
}


extension CSLandingViewController {
    func showActivityIndicator() {
        activityIndicator.startAnimating()
        progressRingView.isUserInteractionEnabled = false
    }
    
    func dismissIndicator() {
        activityIndicator.stopAnimating()
        progressRingView.isUserInteractionEnabled = true
    }
}
