import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    private let buttons: Array<UIButton> = {
        let arrayOfButtons = (0..<3).map {_ in UIButton()}
        for button in arrayOfButtons{
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.masksToBounds = true
            button.backgroundColor = .lightGray
            button.layer.borderWidth = 1
            button.addTarget(self, action: #selector(funcao), for: .touchUpInside)
        }
        return arrayOfButtons
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize:22)
        label.text = "Escolha a bandeira correta"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addViewsInHirearchy()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func addViewsInHirearchy() {
        for button in buttons{
            addSubview(button)
        }
        addSubview(title)
    }
    
    func setup(flag1: String, flag2: String, flag3: String){
        buttons[0].setImage(UIImage(named: flag1), for: .normal)
        buttons[1].setImage(UIImage(named: flag2), for: .normal)
        buttons[2].setImage(UIImage(named: flag3), for: .normal)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            title.centerXAnchor.constraint(equalTo:  centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttons[0].topAnchor.constraint(equalTo: title.bottomAnchor, constant: 50),
            buttons[0].centerXAnchor.constraint(equalTo: centerXAnchor),
            buttons[1].topAnchor.constraint(equalTo: buttons[0].bottomAnchor, constant: 20),
            buttons[1].centerXAnchor.constraint(equalTo: centerXAnchor),
            buttons[2].topAnchor.constraint(equalTo: buttons[1].bottomAnchor, constant: 20),
            buttons[2].centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
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
