//
//  OrderTableViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 16.09.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol OrderVCInputProtocol: class {
    func reloadData()
    func getPrice(from orderedNuts: [OrderNut])
}

protocol OrderVCOutputProtocol {
    init(view: OrderVCInputProtocol)
    
    var orderedNut: OrderNut? { get }
    var orderedNutsCount: Int { get }
    func selectItem(with indexPath: IndexPath)
    func getOrderedNutsList()
    func openMakingOrder()
}

class OrderTableViewController: UIViewController {

    @IBOutlet var userNameOutlet: UILabel!
    @IBOutlet var orederTableOutlet: UITableView!
    @IBOutlet var priceLabelOutlet: UILabel!
    var presenter: OrderVCOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.orederTableOutlet.delegate = self
        self.orederTableOutlet.dataSource = self
        setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        presenter.getOrderedNutsList()
        
    }
    
    @IBAction func getOrderButton(_ sender: UIButton) {
        presenter.openMakingOrder()
    }
    
    func setUpTableView() {
        orederTableOutlet.numberOfRows(inSection: presenter.orderedNutsCount)
    }
    
    func getPrice(from orderedNuts: [OrderNut]) {
        var price: Int = 0
        for item in orderedNuts {
            price += item.nutPrice
        }
        priceLabelOutlet.text = "\(price) рублей"
    }

}

extension OrderTableViewController: OrderVCInputProtocol {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.orederTableOutlet.reloadData()
        }
    }
}

extension OrderTableViewController: UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orederTableOutlet.dequeueReusableCell(withIdentifier: "orderProductCell") as! OrderProductTableViewCell
        presenter.selectItem(with: indexPath)
        cell.configure(with: presenter.orderedNut)
        orederTableOutlet.cellForRow(at: indexPath)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.orderedNutsCount
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MakeOrderSegue" {
            let makeOrderVC = segue.destination as! MakingOrderViewController
            let configurator = MakingOrderViewConfigurator()
            configurator.configurate(with: makeOrderVC)
        }
    }
}
