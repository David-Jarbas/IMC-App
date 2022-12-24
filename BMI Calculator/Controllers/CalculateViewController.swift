//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value) // coloca os valores em casas decimais e conecta o slider com o botao
       
        heightLabel.text = "\(height)m" // acrescenta o "m" de metros na label
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        
        weightLabel.text = "\(weight)kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value  // Armazena o valor obtido no slider nas variaveis height e weight
        let weight = weightSlider.value
        
        let bmi = weight / pow(height, 2) // func pow Retorna um número decimal elevado a uma determinada potência.
        calculatorBrain.calculateBMI(height: height, weight: weight) // pega o valor obtido no parametro da func calculateBMI
        
        self.performSegue(withIdentifier: "goToResult", sender: self) // "self" faz referencia a class atual. o performSegue é um metodo herdado do UiViewController. o parametro seleciona o identificador do segue e o sender faz referencia a class UiViewController. esta linha linka as duas telas atraves do segue
    }
    
    // prepare for segue é utilizado para passar dados de uma tela para outra
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // prepare é um metodo herdado do UiViewController. aciona o segue
        if segue.identifier == "goToResult" { // confirma o identifier do segue
            let destinationVC = segue.destination as! ResultViewController // cria uma const que armazena o valor do segue.destination. o as! especifica qual é o destino (viewController) que no caso é o arquivo Result
            destinationVC.bmiValue = calculatorBrain.getBMIValue() // a variavel opcional do arquivo result (segue) recebe o return da funcao getBMIValue
            destinationVC.advice = calculatorBrain.getAdvice() 
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}
