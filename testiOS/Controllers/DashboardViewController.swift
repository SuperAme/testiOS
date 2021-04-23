//
//  DashboardViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//

import Foundation
import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var financeView: UIView!
    @IBOutlet weak var currencyView: UIView!
    @IBOutlet weak var segmentedCtrl: UISegmentedControl!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        financeView.alpha = 1
        currencyView.alpha = 0
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
            guard let field = alert.textFields?[0], let field2 = alert.textFields?[1], let text = field.text, let text2 = field2.text , !text.isEmpty else {
                return
            }
            self!.segmentedCtrl.selectedSegmentIndex = 0
            print(text+"++"+text2)
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
            guard let field = alert.textFields?[0], let field2 = alert.textFields?[1], let text = field.text, let text2 = field2.text , !text.isEmpty else {
                return
            }
            self!.segmentedCtrl.selectedSegmentIndex = 0
            print(text+"++"+text2)
        }))
        present(alert, animated: true)
    }
}

