//
//  EscribeViewController.swift
//  FunGro
//
//  Created by Esteban Arocha Ortuno on 11/7/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class EscribeViewController: UIViewController {

    @IBOutlet weak var imgPregunta: UIImageView!
    @IBOutlet weak var tfEscribe: UITextField!
    @IBOutlet weak var tvPuntuacion: UITextField!
    
    var selectedOption = ""
    var imgArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgPregunta.image = UIImage(named: Juego.juego.arrPreguntasEscribe[Juego.juego.indiceEscribe])
        selectedOption = Juego.juego.arrPreguntasEscribe[Juego.juego.indiceEscribe]
    }
    
    func nuevaPregunta() {
        if(Juego.juego.indiceEscribe == 1) { //SI HAY MAS GRUPOS ESTA CONDICIÓN CAMBIA
            self.performSegue(withIdentifier: "resultadoEscribe", sender: self)
        }
        else{
            selectedOption = Juego.juego.arrPreguntasEscribe[Juego.juego.indiceEscribe]
            imgPregunta.image = UIImage(named: Juego.juego.arrPreguntasEscribe[Juego.juego.indiceEscribe])
            tvPuntuacion.text = "Score: \(Juego.juego.puntuacionEscribe)"
        }
    }
    
    
    @IBAction func enviar(_ sender: Any) {
        if(selectedOption == tfEscribe.text && Juego.juego.intentoEscribe == 0) {
            let alert = UIAlertController(title: "Respuesta correcta", message: "Siguiente pregunta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
                self.navigationController?.popViewController(animated: true)
            }))
            
            Juego.juego.puntuacionEscribe += 10
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            nuevaPregunta()
        }
        else if (selectedOption == tfEscribe.text && Juego.juego.intentoEscribe == 1){
            let alert = UIAlertController(title: "Respuesta correcta", message: "Siguiente pregunta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
                self.navigationController?.popViewController(animated: true)
            }))
            
            Juego.juego.puntuacionEscribe += 5
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            nuevaPregunta()
        }
        else if (selectedOption != tfEscribe.text && Juego.juego.intentoEscribe == 0){
            let alert = UIAlertController(title: "Respuesta incorrecta", message: "¡Inténtalo de nuevo!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
            
            Juego.juego.intentoEscribe = 1
        }
        else {
            let alert = UIAlertController(title: "Respuesta incorrecta", message: "Siguiente pregunta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
            
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            nuevaPregunta()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaResultado = segue.destination as! ViewControllerResult
        vistaResultado.label = Juego.juego.puntuacionEscribe
        Juego.juego.puntuacionEscribe = 0
        Juego.juego.arrPreguntasEscribe.shuffle()
        Juego.juego.indiceEscribe = 0
        Juego.juego.intentoEscribe = 0
    }
}
