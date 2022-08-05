//
//  ClimaModelo.swift
//  ClimaCFE
//
//  Created by marco rodriguez on 05/08/22.
//

import Foundation

struct ClimaModelo {
    let condicionID: Int
    let nombreCiudad: String
    let descripcionClima: String
    let temperaturaCelcius: Double
//    let humedad: Double
//    let sensacion: Double
//    let tempMin: Double
//    let tempMax: Double
    
    //Propiedad Computada
    var condicionClima: String {
        switch condicionID {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.bolt.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
            return "cloud.sun"
        default:
            return "cloud"
        }
    }
    
    //Imagenes personalizadas
    var fondoClima: String {
        switch condicionID {
        case 200...232:
            return "despejado"
        case 300...321:
            return "llovizna"
        case 500...531:
            return "nubes"
        case 600...622:
            return "nevando"
        case 701...781:
            return "soleado"
        case 800:
            return "lloviza"
        case 801...804:
            return "soleado"
        default:
            return "cloud"
        }
    }
    
    //Propiedad computada
    var temperaturaDecimal: String {
        return String(format: "%.1f", temperaturaCelcius)
    }
}
