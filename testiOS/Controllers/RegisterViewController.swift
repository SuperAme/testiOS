//
//  RegisterViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//

import Foundation
import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func registerButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authresult, error) in
                if let e = error {
                    AlertView.instance.showAlert(title: "ERROR", message: e.localizedDescription, alertType: .failure)
                } else {
                    AlertView.instance.showAlert(title: "Usuario Registrado", message: "Felicidades!", alertType: .success)
                }
            }
        }
    }
}

