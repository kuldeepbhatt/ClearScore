//
//  ViewController.swift
//  ClearScore
//
//  Created by Kuldeep Bhatt on 2022/08/02.
//

import UIKit
import MKRingProgressView

class CSDetailViewController: UIViewController {
    @IBOutlet private weak var detailedReportTable: UITableView!
    private var reportDetailViewModel: ReportDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Report details"
    }
}

extension CSDetailViewController {
    func setUp(with reportDetailViewModel: ReportDetailViewModel) {
        self.reportDetailViewModel = reportDetailViewModel
    }
}

extension CSDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func heightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat? {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CSReportDetailCell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as? CSReportDetailCell else { return UITableViewCell() }
        cell.configure(values: self.reportDetailViewModel)
        return cell
    }
}
