//
//  ViewController.swift
//  TutorHub
//
//  Created by İbrahim Bayram on 9.03.2023.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var viewModel : LoginViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
    }
    @IBAction func signUpButtonClicked(_ sender: Any) {
        guard let mail = emailTextField.text , let password = passwordTextField.text else {return}
        if mail == "" && password == "" {
            self.present(Alerts().alertBox(title: "Error", message: "Please enter email and password."), animated: true)
        }else {
            self.viewModel = LoginViewModel(email: mail, password: password)
            viewModel?.createUser(completion: { isOkey in
                if isOkey {
                    print("dorun yok")
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            })
        }
    }
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        guard let mail = emailTextField.text , let password = passwordTextField.text else {return}
        if mail == "" && password == "" {
            self.present(Alerts().alertBox(title: "Error", message: "Please enter email and password."), animated: true)
        }else {
            self.viewModel = LoginViewModel(email: mail, password: password)
            viewModel?.signIn(completion: { isOkey in
                if isOkey {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }else {
                    self.present(Alerts().alertBox(title: "Error", message: "Wrong email or password."), animated: true)
                }
            })
        }
    }

}

