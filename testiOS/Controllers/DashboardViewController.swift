//
//  DashboardViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//

import Foundation
import UIKit
import Firebase
import CoreData

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var financeView: UIView!
    @IBOutlet weak var currencyView: UIView!
    @IBOutlet weak var segmentedCtrl: UISegmentedControl!
   
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var inOut = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        financeView.alpha = 1
        currencyView.alpha = 0
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    @IBAction func segmentedControlPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            financeView.alpha = 1
            currencyView.alpha = 0
        case 1:
            financeView.alpha = 0
            currencyView.alpha = 1
        case 2:
            showPlusAlert()
        case 3:
            showMinusAlert()
        default:
            break;
        }
    }
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError{
            AlertView.instance.showAlert(title: "Error", message: signOutError.localizedDescription, alertType: .failure)
        }
    }
    
    func showPlusAlert() {
        let alert = UIAlertController(title: "Agrega tu ingreso", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa cantidad en numero"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa Descripción"
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action) in
            self.segmentedCtrl.selectedSegmentIndex = 0
            self.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Agregar", style: .default, handler: { [weak self] _ in
            guard let cuantity = alert.textFields?[0], let description = alert.textFields?[1], let text = cuantity.text, let text2 = description.text , !text.isEmpty else {
                return
            }
            self!.segmentedCtrl.selectedSegmentIndex = 0
            
            self!.saveData(inOut: true, descr: description.text!, cuantity: Float(cuantity.text!)!)
        }))
        present(alert, animated: true)
    }
    func showMinusAlert() {
        
        let alert = UIAlertController(title: "Agrega tu gasto", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa cantidad en numero"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa Descripción"
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action) in
            self.segmentedCtrl.selectedSegmentIndex = 0
            self.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Agregar", style: .default, handler: { [weak self] _ in
            guard let cuantity = alert.textFields?[0], let description = alert.textFields?[1], let text = cuantity.text, let text2 = description.text , !text.isEmpty else {
                return
            }
            self!.segmentedCtrl.selectedSegmentIndex = 0
            self!.saveData(inOut: false, descr: description.text!, cuantity: Float(cuantity.text!)!)
        }))
        present(alert, animated: true)
    }
    
    func saveData(inOut: Bool, descr: String, cuantity: Float) {
        let newFinance = Finance(context: context)
        newFinance.inOut = inOut
        newFinance.descr = descr
        newFinance.cuantity = cuantity
        do {
            try context.save()
        } catch {
            AlertView.instance.showAlert(title: "Error", message: "error saving Data", alertType: .failure)
        }
    }
        
}

