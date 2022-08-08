//
//  ViewController.swift
//  ClimaCFE
//
//  Created by marco rodriguez on 05/08/22.
//

import UIKit
import CoreLocation

//este VC adopta el protocolo ClimaManagerDelegate
class ViewController: UIViewController, ClimaManagerDelegate {
    
    @IBOutlet weak var fondoClimaImageView: UIImageView!
    @IBOutlet weak var climaImageView: UIImageView!
    @IBOutlet weak var buscarCiudadTextField: UITextField!
    @IBOutlet weak var descripcionClimalLabel: UILabel!
    @IBOutlet weak var temperaturaLabel: UILabel!
    
    var climaManager = ClimaManager()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Definir el delegado del climaManager, sera este ViewController
        climaManager.delegado = self
        buscarCiudadTextField.delegate = self
        
        //locationManager.delegate = self
        
        //Solicitar el permiso
        locationManager.requestWhenInUseAuthorization()
        
        //Acceder a la ubicacion
//        locationManager.requestLocation()
        
        
    }

    
    func actualizarClima(clima: ClimaModelo) {
        print(clima)
        
        DispatchQueue.main.async {
            self.temperaturaLabel.text = "\(clima.temperaturaDecimal)°C"
            self.descripcionClimalLabel.text = "En \(clima.nombreCiudad) esta \( clima.descripcionClima)"
            self.climaImageView.image = UIImage(systemName: clima.condicionClima)
        }
        
    }
    
    func huboError(cualError: Error) {
        print(cualError)
    }
    
    @IBAction func GPSButton(_ sender: UIButton) {
        
    }
    
    @IBAction func BuscarButton(_ sender: UIButton) {
        climaManager.fetchClima(nombreCiudad: buscarCiudadTextField.text ?? "oaxaca")
        buscarCiudadTextField.text = ""
        //ocultamos el teclado virtual
        buscarCiudadTextField.endEditing(true)
    }
    
}

// MARK: - GPS
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Se detectó la ubicacion del usuario")
    }
}

// MARK: - Protocolo UITextViewDelegate
extension ViewController: UITextFieldDelegate {
    //1.- Habilitar el boton del teclado virtual
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //ocultar el teclado
        buscarCiudadTextField.endEditing(true)
        
        return true
    }
    
    //2.- identificar cuando el usuario termino de editar y se puede borrar el contenido del textField
    func textFieldDidEndEditing(_ textField: UITextField) {
        climaManager.fetchClima(nombreCiudad: buscarCiudadTextField.text ?? "morelia")
        buscarCiudadTextField.text = ""
    }
    
    //3.- Evitar que el usuario no escriba nada
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if buscarCiudadTextField.text != "" {
            return true
        } else {
            //El usuario aun no escribe nada
            buscarCiudadTextField.placeholder = "Debes escribir algo..."
            return false
        }
    }
}
