//
//  ForgotPasswordViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 06.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol ForgotPasswordViewControllerInputProtocol: class {
    func showSuccsessAlert()
    func returnToMainPage()
}

protocol ForgotPasswordViewControllerOutputProtocol {
    init(view: ForgotPasswordViewControllerInputProtocol)
    func sendPassword(with email: String)
}


class ForgotPasswordViewController: UIViewController, ForgotPasswordViewControllerInputProtocol {
    
    var presenter: ForgotPasswordViewControllerOutputProtocol!
    private let configurator: ForgotPasswordPageViewConfiguratorProtocol = ForgotPasswordPageViewConfigurator()
    @IBOutlet var emailtextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func sendPassword(_ sender: UIButton) {
        if emailtextField.text != nil {
            presenter.sendPassword(with: emailtextField.text!)
        }
    }
}

extension ForgotPasswordViewController {
    func showSuccsessAlert() {
        let alert = UIAlertController(title: "Успешно",
                                      message: "На ваш email отправлено письмо длля сброса пароля",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            self!.returnToMainPage()
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func returnToMainPage() {
        dismiss(animated: true)
    }
}
