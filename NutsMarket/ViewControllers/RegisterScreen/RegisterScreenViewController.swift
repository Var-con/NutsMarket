//
//  RegisterScreenViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 06.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol RegisterScreenViewInputProtocol: class {
    func displaySuccsesAlert()
    func displayErrorAlert(_ title: String, text: String)
}

protocol RegisterScreenViewOutputProtocol {
    func registerUser(with email: String, password: String)
    init(view: RegisterScreenViewInputProtocol)
}


class RegisterScreenViewController: UIViewController, RegisterScreenViewInputProtocol {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var secondNameTextField: UITextField!
    
    
    var presenter: RegisterScreenViewOutputProtocol!
    let configurator: RegisterViewConfiguratorProtocol = RegisterViewConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        presenter.registerUser(with: email,
                               password: password)
    }
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true)
    }
}

extension RegisterScreenViewController {
    func displaySuccsesAlert() {
        let alert = UIAlertController(title: "Успешно создан",
                                      message: "Пользователь успешно создан",
                                      preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func displayErrorAlert(_ title: String, text: String) {
        let alert = UIAlertController(title: title,
                                      message: text,
                                      preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}
