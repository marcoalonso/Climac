//
//  ClimaData.swift
//  ClimaCFE
//
//  Created by marco rodriguez on 05/08/22.
//

import Foundation

//Decodificar la API

struct ClimaData: Codable {
    let name: String
    let cod: Int
    let main: Main
    let weather: [Weather]
}

struct Weather: Codable {
    let description: String
    let icon: String
    let id: Int //propiedad computada que me cambiar el fondo
}

struct Main: Codable {
    let temp: Double
}
