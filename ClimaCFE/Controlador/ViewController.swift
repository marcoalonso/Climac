//
//  ViewController.swift
//  ClimaCFE
//
//  Created by marco rodriguez on 05/08/22.
//

import UIKit

//este VC adopta el protocolo ClimaManagerDelegate
class ViewController: UIViewController, ClimaManagerDelegate {
    
    @IBOutlet weak var fondoClimaImageView: UIImageView!
    @IBOutlet weak var climaImageView: UIImageView!
    @IBOutlet weak var buscarCiudadTextField: UITextField!
    @IBOutlet weak var descripcionClimalLabel: UILabel!
    @IBOutlet weak var temperaturaLabel: UILabel!
    
    var climaManager = ClimaManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Definir el delegado del climaManager sera este ViewController
        climaManager.delegado = self
    }

    
    func actualizarClima(clima: ClimaModelo) {
        
    }
    
    func huboError(cualError: Error) {
        
    }
    
    @IBAction func GPSButton(_ sender: UIButton) {
        
    }
    
    @IBAction func BuscarButton(_ sender: UIButton) {
        
    }
    
}

