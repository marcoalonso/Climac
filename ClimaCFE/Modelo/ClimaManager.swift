//
//  ClimaManager.swift
//  ClimaCFE
//
//  Created by marco rodriguez on 05/08/22.
//

import Foundation

protocol ClimaManagerDelegate {
    //Dos metodos obligatorios que el VC debe de implementar
    func actualizarClima(clima: ClimaModelo)
    func huboError(cualError: Error)
}

struct ClimaManager {
    var delegado: ClimaManagerDelegate? //No sabe si habra un VC que se establezca como delegado
    
    let climaURL = "https://api.openweathermap.org/data/2.5/weather?appid=698cb29c0a1e70d1a30a0a9982f6a95a&units=metric&lang=es"
    
    func fetchClima(nombreCiudad: String){
        //concatenar la url base con los datos del usuario
        let urlString = "\(climaURL)&q=\(nombreCiudad)"
        
        realizarSolicitud(url: urlString)
    }
    
    //hara todo el proceso de decodificacion de la API
    func realizarSolicitud(url: String){
        //Proceso de networking
        // 1.- Crear un objeto URL
        // 2.- Crear una sesion
        // 3.- Asignar una tarea a la sesion
        // 4.- Comezar la tarea
    }
}
