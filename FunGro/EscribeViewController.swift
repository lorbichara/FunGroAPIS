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
        definesPresentationContext = true
        nuevaPregunta()
    }
    
    func nuevaPregunta() {
        print("Nueva pregunta \(Juego.juego.indiceEscribe)")
        if(Juego.juego.indiceEscribe == 2) { //SI HAY MAS GRUPOS ESTA CONDICIÓN CAMBIA
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
            Juego.juego.puntuacionEscribe += 10
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            nuevaPregunta()
        }
        else if (selectedOption == tfEscribe.text && Juego.juego.intentoEscribe == 1){
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
        else if ((selectedOption != tfEscribe.text && Juego.juego.indiceEscribe == 1)){
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            nuevaPregunta()
        }
        else {
            let alert = UIAlertController(title: "Respuesta incorrecta", message: "Siguiente pregunta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
            print(Juego.juego.indiceEscribe)
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            print(Juego.juego.indiceEscribe)
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
    
    @IBAction func unwindResultEscribe(for segue: UIStoryboardSegue, sender: Any?){
        self.dismiss(animated: true, completion: nil)
    }
}
