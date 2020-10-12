//
//  MakingOrderViewController.swift
//  NutsMarket
//
//  Created by Станислав Климов on 11.10.2020.
//  Copyright © 2020 Stanislav Klimov. All rights reserved.
//

import UIKit

protocol MakingOrderVCInputProtocol: class{
    func fetchPrice()
}

protocol MakingOrderVCOutputProtocol {
    init(view: MakingOrderVCInputProtocol)
}

class MakingOrderViewController: UIViewController, MakingOrderVCInputProtocol {
    
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var personNameLabel: UILabel!
    @IBOutlet var phoneNumberTF: UITextField!
    @IBOutlet var streetAdresTF: UITextField!
    @IBOutlet var houseAdresTF: UITextField!
    @IBOutlet var flatAdressTF: UITextField!
    @IBOutlet var priceLabelTF: UILabel!
    
    
    var presenter: MakingOrderVCOutputProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func makingOrderButton(_ sender: UIButton) {
    }
    
    func fetchPrice() {
        
    }
    
    

}
