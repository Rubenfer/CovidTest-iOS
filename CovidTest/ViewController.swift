//
//  ViewController.swift
//  CovidTest
//
//  Created by Ruben Fernandez on 24/03/2020.
//  Copyright © 2020 Ruben Fernandez. All rights reserved.
//

import UIKit

class PreguntaViewController: UIViewController {
    
    @IBOutlet var pregunta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pregunta.text = CoronavirusTest.shared.preguntaActual.pregunta
    }
    
    @IBAction func si(_ sender: Any) {
        CoronavirusTest.shared.sumarPuntuacion()
        nextQuestion()
    }
    
    @IBAction func no(_ sender: Any) {
        nextQuestion()
    }
    
    func nextQuestion() {
        var vc: UIViewController
        do {
            try CoronavirusTest.shared.nextQuestion()
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "pregunta")
        } catch {
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "resultado")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

class ResultadoViewController: UIViewController {
    
    @IBOutlet var resultado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultado.text = CoronavirusTest.shared.getResultado() ? "Tienes sintomatología compatible con COVID-19" : "La sintomatología no parece estar relacionada con COVID-19"
    }
    
    @IBAction func iniciar(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
