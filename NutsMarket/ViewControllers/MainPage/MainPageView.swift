//
//  ViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 27.08.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol MainPageViewInputProtocol: class {
}

protocol MainPageViewOutputProtocol {
    func loginButtonPressed(with login: String, password: String)
    func displayRegisterView()
    init(view: MainPageViewInputProtocol)
}

class MainPageView: UIViewController, MainPageViewInputProtocol {
    
    @IBOutlet var loginTextFieldOutlet: UITextField!
    @IBOutlet var passwordTextFieldOutlet: UITextField!
    
    var presenter: MainPageViewOutputProtocol!
    private let configurator: MainPageViewConfiguratorProtocol = MainPageViewConfigurator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registerViewSegue" {
        let registerVC = segue.destination as! RegisterScreenViewController
        let configurator: RegisterViewConfigurator = RegisterViewConfigurator()
        configurator.congigure(view: registerVC)
        } else if segue.identifier == "marketViewSegue" {

        }
    }

    @IBAction func enterButtonAction(_ sender: UIButton) {
        presenter.loginButtonPressed(with: loginTextFieldOutlet.text ?? "", password: passwordTextFieldOutlet.text ?? "")
    }
    
    @IBAction func registerButtonAction(_ sender: UIButton) {
        presenter.displayRegisterView()
    }
    
    @IBAction func forgottenPasswordOutlet(_ sender: UIButton) {
    }
    
}


