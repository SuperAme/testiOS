//
//  DashboardViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
//        AlertView.instance.showAlert(title: "master", message: "Again", alertType: .failure)
        registerAlert.instance.showAlert()
    }
}
