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
    var user = "usuario"
    var itemArray = [User]()
    
    var selectedCategory : User? {
        didSet{
            loadItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
//        AlertView.instance.showAlert(title: "master", message: "Again", alertType: .failure)
        registerAlert.instance.showAlert()
    }
    func loadItems(with request: NSFetchRequest<User> = User.fetchRequest(), predicate: NSPredicate? = nil) {
        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", "usuario")
        
        if let addtionalPredicate = predicate {
            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, addtionalPredicate])
        } else {
            request.predicate = categoryPredicate
        }
        do {
            itemArray = try context.fetch(request)
            print(itemArray)
//            for data in result as! [NSManagedObject] {
//                print(data.value(forKey: "username") as! String)
//            }
            
        } catch {
            
            print("Failed")
        }
    }
}
