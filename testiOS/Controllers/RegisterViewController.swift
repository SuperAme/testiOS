//
//  RegisterViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//

import Foundation
import UIKit
import CoreData

class RegisterViewController: UIViewController {
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func addUser() {
        let newUser = User(context: context)
        newUser.name = userNameTextField.text
        newUser.password = passwordTextField.text
        do {
            try context.save()
            print("ok")
        } catch {
            print("error saving User \(error)")
        }
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        addUser()
        
    }
}

