//
//  DashboardViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//

import Foundation
import UIKit
import CoreData

class DashboardViewController: UIViewController {
    var usuario = "usuario"
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadUser()
    }
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
//        AlertView.instance.showAlert(title: "master", message: "Again", alertType: .failure)
        registerAlert.instance.showAlert()
    }
    
    func loadUser() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let result = try context.fetch(request)
            print(result)
        } catch {
            print("error\(error)")
        }
    }
    
}
