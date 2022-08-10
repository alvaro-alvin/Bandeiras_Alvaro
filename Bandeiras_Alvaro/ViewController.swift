//
//  ViewController.swift
//  Bandeiras_Alvaro
//
//  Created by user219712 on 8/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var paises = [String]()
    var pontuacao = 0
    var respostaCorreta = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        paises += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        fazerPergunta()
        
    }

    func fazerPergunta(action: UIAlertAction! = nil){
        
        paises.shuffle()
        
        button1.setImage(UIImage(named: paises[0]), for: .normal)
        button2.setImage(UIImage(named: paises[1]), for: .normal)
        button3.setImage(UIImage(named: paises[2]), for: .normal)
        
        respostaCorreta = Int.random(in: 0...2)
        
        title = paises[respostaCorreta].uppercased()
    }
    
    @IBAction func clicouBotao(_ sender: UIButton) {
        
        var titulo: String
        
        if sender.tag == respostaCorreta {
            titulo = "Acertou"
            pontuacao += 1
            
            
        }
        else {
            titulo = "Errou"
            pontuacao -= 1
        }
        
        let alerta = UIAlertController(title: titulo, message: "Sua pontuacao e \(pontuacao)", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Continuar", style: .default, handler: fazerPergunta))
        present(alerta, animated: true)
    }
    
}


