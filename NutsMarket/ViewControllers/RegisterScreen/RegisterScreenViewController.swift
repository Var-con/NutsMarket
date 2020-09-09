//
//  RegisterScreenViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 06.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol RegisterScreenViewInputProtocol: class {
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
        
        configurator.congigure(view: self)
        
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
