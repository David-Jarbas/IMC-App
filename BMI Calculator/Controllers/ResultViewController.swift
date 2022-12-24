//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by David Jarbas on 08/12/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

// SEGUNDA TELA 
import UIKit

class ResultViewController: UIViewController { // result class esta herdando da UiViewController

    // estas variáveis vao receber valores das funcoes do calculatorBrain
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil) // retorna a tela inicial. "nil" selecionado para que nao aconteca nada depois do retorno
    }

}
