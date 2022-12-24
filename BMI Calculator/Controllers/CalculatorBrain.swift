//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by David Jarbas on 13/12/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI? // importa a struct do BMI
    
    func getBMIValue() -> String { // Retornamos o BMI para o calculateViewController como uma string
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0) // checa se o bmi é nil. se nao for nil podemos pegar o valor, se for nulo usaremos o 0.0
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Sem Aviso" // se o valor nao for nulo use a primeira opcao, caso contrario use a segunda
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    
    mutating func calculateBMI(height: Float, weight: Float) { // func que calcula o BMI
       let bmiValue = weight / (height * height) // formula de calcular o bmi
        
        if bmiValue < 18.9 {
            bmi = BMI(value: bmiValue, advice: "Coma mais tortas!", color: UIColor.blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Mantenha o peso!", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Coma menos tortas!", color: UIColor.red)
        }
    }
}
