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
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var userArray = [User]()
    var user = User()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userSelected()
        tableView.dataSource = self
    }
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
//        AlertView.instance.showAlert(title: "master", message: "Again", alertType: .failure)
//        registerAlert.instance.showAlert()let newToDo = ToDoModel()
        
    }
    func userSelected() {
        do {
            let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name MATCHES %@", "usuario")
            userArray = try context.fetch(fetchRequest)
            user = userArray[0]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch let err{
            print(err.localizedDescription)
        }
    }
//    func addFinance(descr: String, cuantity: String) {
//        let newFinance = Finance(context: context)
//        newFinance.descr = descr
//        newFinance.inOut = cuantity
//        newFinance.parentCategory = user
//        do {
//            try context.save()
//            print("ok")
//        } catch {
//            print("error saving User \(error)")
//        }
//    }
    
    func alertToAddMoney() {
        let alert = UIAlertController(title: "Agrega tu ingreso", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa cantidad en numero"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa Descripción"
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))

        alert.addAction(UIAlertAction(title: "Agregar", style: .default, handler: { [weak self] _ in
            guard let field = alert.textFields?[0], let field2 = alert.textFields?[1], let text = field.text, let text2 = field2.text , !text.isEmpty else {
                return
            }
            print(text+"++"+text2)
        }))
        present(alert, animated: true)
    }
    
    func alertToSpend() {
        let alert = UIAlertController(title: "Agrega tu gasto", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa cantidad en numero"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Ingresa Descripción"
        }
        
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }))

        alert.addAction(UIAlertAction(title: "Agregar", style: .default, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
        }))
        present(alert, animated: true)
    }
    
    @IBAction func topBarPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("1")
        case 1:
            print("2")
        case 2:
            alertToAddMoney()
        case 3:
            alertToSpend()
        default:
            break;
        }
    }
}

extension DashboardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = userArray[indexPath.row].name
        return cell
    }
}
