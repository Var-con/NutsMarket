//
//  ViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 27.08.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol MainPageViewInputProtocol: class {
    func showAlert()
}

protocol MainPageViewOutputProtocol {
    func loginButtonPressed(with login: String, password: String)
    func displayRegisterView()
    func displayForgottenPasswordView()
    func checkPreviouslyEntry()
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
        presenter.checkPreviouslyEntry()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registerViewSegue" {
        let registerVC = segue.destination as! RegisterScreenViewController
        let configurator: RegisterViewConfigurator = RegisterViewConfigurator()
        configurator.congigure(view: registerVC)
        } else if segue.identifier == "marketSegue" {
            let marketview = segue.destination as! MarketCollectionViewController
            
            let configurator = MarketConfugurator()
            configurator.configure(with: marketview)
        } else if segue.identifier == "forgotPasswordSegue" {
            let forgotPasswordView = segue.destination as! ForgotPasswordViewController
            let confifurator: ForgotPasswordPageViewConfigurator = ForgotPasswordPageViewConfigurator()
            confifurator.configure(with: forgotPasswordView)
        }
    }

    @IBAction func enterButtonAction(_ sender: UIButton) {
        presenter.loginButtonPressed(with: loginTextFieldOutlet.text ?? "", password: passwordTextFieldOutlet.text ?? "")
    }
    
    @IBAction func registerButtonAction(_ sender: UIButton) {
        presenter.displayRegisterView()
    }
    
    @IBAction func forgottenPasswordOutlet(_ sender: UIButton) {
        presenter.displayForgottenPasswordView()
    }
    
}

extension MainPageView {
    func showAlert() {
        let alert = UIAlertController(title: "Авторизация не удалась",
                                      message: "Проверьте вводимые данные",
                                      preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok",
                                     style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


