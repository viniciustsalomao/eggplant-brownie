//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Vinícius Tinajero Salomão on 25/06/21.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - atributos
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View life cyvle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func adicionarItem(_ sender: UIButton) {
        
        guard let nome = nomeTextField.text else {return}
        guard let caloriasText = caloriasTextField.text, let calorias = Double(caloriasText) else {return}
        
        let item = Item(nome: nome, calorias: calorias)
        delegate?.add(item)
        navigationController?.popViewController(animated: true)
    }
    

}

