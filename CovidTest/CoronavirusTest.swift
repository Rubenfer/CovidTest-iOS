//
//  CoronavirusTest.swift
//  CovidTest
//
//  Created by Ruben Fernandez on 24/03/2020.
//  Copyright © 2020 Ruben Fernandez. All rights reserved.
//

import Foundation

enum TestError: Error {
    case end
}

class CoronavirusTest {
    
    private static let preguntas = [
        (pregunta: "¿Tienes sensación de falta de aire de inicio brusco (en ausencia de cualquier otra patología que justifique este síntoma)?", puntuacion: 60),
        (pregunta: "¿Tienes fiebre? (+37.7ºC)", puntuacion: 15),
        (pregunta: "¿Tienes tos seca y persistente?", puntuacion: 15),
        (pregunta: "¿Has tenido contacto estrecho con algún paciente positivo confirmado?", puntuacion: 29),
        (pregunta: "¿Tienes mucosidad en la nariz?", puntuacion: 0),
        (pregunta: "¿Tienes dolor muscular?", puntuacion: 0),
        (pregunta: "¿Tienes sintomatología gastrointestinal?", puntuacion: 0),
        (pregunta: "¿Llevas más de 20 días con estos síntomas?", puntuacion: -15)
    ]
    
    private(set) var preguntaActual = preguntas[0]
    private var puntuacion = 0
    private var currentIndex = 0
    
    static private(set) var shared = CoronavirusTest()
    
    private init() {}
    
    func sumarPuntuacion() {
        puntuacion += preguntaActual.puntuacion
    }
    
    func getResultado() -> Bool {
        CoronavirusTest.shared = CoronavirusTest()
        return puntuacion >= 30 ? true : false
    }
    
    func nextQuestion() throws {
        currentIndex += 1
        guard currentIndex < CoronavirusTest.preguntas.count else { throw TestError.end }
        preguntaActual = CoronavirusTest.preguntas[currentIndex]
    }
    
}
