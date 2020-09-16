//
//  DetailViewConfigurator.swift
//  NutsMarket
//
//  Created by Станислав Климов on 12.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import Foundation

protocol DetailViewConfiguratorProtocol {
    func configure(with view: DetailsViewController, and nut: NutItem)
}


class DetailViewConfigurator: DetailViewConfiguratorProtocol {
    func configure(with view: DetailsViewController, and nut: NutItem) {
        let presenter = DetailsViewPresenter(view: view)
        let interactor = DetailViewInteractor(presenter: presenter, and: nut)
        view.presenter = presenter
        presenter.interactor = interactor
    }
}


