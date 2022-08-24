//
//  ViewController.swift
//  Bandeiras_Alvaro
//
//  Created by user219712 on 8/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    @objc func clicouBotao (_ sender: UIButton) {
        
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
    
    



    var buttons = (0..<3).map {_ in UIButton()}
    var paises = [String]()
    var pontuacao = 0
    var respostaCorreta = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for button in buttons{
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.masksToBounds = true
            button.backgroundColor = .lightGray
            button.layer.borderWidth = 1
            button.addTarget(self, action: #selector(clicouBotao), for: .touchUpInside)
            
            self.view.addSubview(button)
        }
        setupConstraints()
        
        view.backgroundColor = .white
        title = "Aplicativo Bandeiras"
        
        /* button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
         */
        paises += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        fazerPergunta()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            buttons[0].topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            buttons[0].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttons[1].topAnchor.constraint(equalTo: buttons[0].bottomAnchor, constant: 20),
            buttons[1].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttons[2].topAnchor.constraint(equalTo: buttons[1].bottomAnchor, constant: 20),
            buttons[2].centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    func fazerPergunta(action: UIAlertAction! = nil){
        
        paises.shuffle()
        
        buttons[0].setImage(UIImage(named: paises[0]), for: .normal)
        buttons[0].tag = 0
        buttons[1].setImage(UIImage(named: paises[1]), for: .normal)
        buttons[1].tag = 1
        buttons[2].setImage(UIImage(named: paises[2]), for: .normal)
        buttons[2].tag = 2
        
        respostaCorreta = Int.random(in: 0...2)
        
        title = paises[respostaCorreta].uppercased()
    }
    
    
    
}


