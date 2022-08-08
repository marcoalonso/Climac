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
    
    func fetchClima(lat: Double, lon: Double){
        let urlString = "\(climaURL)&lat=\(lat)&lon=\(lon)"
        
        realizarSolicitud(url: urlString)
    }
    
    //hara todo el proceso de decodificacion de la API
    func realizarSolicitud(url: String){
        //Proceso de networking
        // 1.- Crear un objeto URL
        if let url = URL(string: url){
            
            // 2.- Crear una sesion
            let session = URLSession(configuration: .default)
            
            // 3.- Asignar una tarea a la sesion
            let tarea = session.dataTask(with: url) { data, respuesta, error in
                
                if let res = respuesta {
                    print(res)
                }
                
                //si hubio un error
                if error != nil {
                    print("Error en la tarea: ",error!.localizedDescription)
                    
                    return
                }
                //desenvolver ese valor opcional
                if let datosSeguros = data {
                    if let clima = self.parseJSON(climaData: datosSeguros){
                        delegado?.actualizarClima(clima: clima)
                    }
                }
            }
            // 4.- Comezar la tarea
            tarea.resume()
        }
    }
    
    func parseJSON(climaData: Data) -> ClimaModelo? {
        let decoder = JSONDecoder()
        
        do{
            let dataDecodificada = try decoder.decode(ClimaData.self, from: climaData)
            //Crear un objeto a partir del ClimaModelo
            let id = dataDecodificada.weather[0].id
            let nombre = dataDecodificada.name
            let descripcion = dataDecodificada.weather[0].description
            let temp = dataDecodificada.main.temp
            
            //el obj que vamos a mandar al VC
            let objClima = ClimaModelo(condicionID: id, nombreCiudad: nombre, descripcionClima: descripcion, temperaturaCelcius: temp)
            
            return objClima
            
        }catch {
            print("Error al decodificar: \(error.localizedDescription)")
            delegado?.huboError(cualError: error)
            return nil
        }
    }
    
    
    
}
