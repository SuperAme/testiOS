//
//  LoginViewController.swift
//  testiOS
//
//  Created by IDS Comercial on 22/04/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        if let email = userTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    AlertView.instance.showAlert(title: "Error", message: e.localizedDescription, alertType: .failure)
                } else {
                    if email != Constants.uniqueUser {
                        AlertView.instance.showAlert(title: "Lo sentimos", message: "solo puedes probar con el usuario usuario@usuario.com con password: usuario", alertType: .failure)
                    } else {
                        self.performSegue(withIdentifier: Constants.loginSegue, sender: self)
                    }
                }
            }
        }
        passwordTextField.text = ""
    }
    
}

