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
        self.title = "Modo Escribe"
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EscribeViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        definesPresentationContext = true
        nuevaPregunta()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let firstImageView = UIImageView(image: UIImage(named: "Diapositiva0.png"))
        firstImageView.frame = view.frame
        view.addSubview(firstImageView)
        view.sendSubviewToBack(firstImageView)
    }
    
    func nuevaPregunta() {
         if(Juego.juego.indiceEscribe == 5) {
//        if(Juego.juego.indiceEscribe == Juego.juego.arrPreguntasEscribe.count) { //SI HAY MAS GRUPOS ESTA CONDICIÓN CAMBIA
            Juego.juego.indiceEscribe = 0
            Juego.juego.intentoEscribe = 0
            Juego.juego.arrPreguntasEscribe.shuffle()
            self.performSegue(withIdentifier: "resultadoEscribe", sender: self)
        }
        else{
            print(Juego.juego.arrPreguntasEscribe)
            print()
            tfEscribe.text = ""
            selectedOption = Juego.juego.arrPreguntasEscribe[Juego.juego.indiceEscribe]
            imgPregunta.image = UIImage(named: Juego.juego.arrPreguntasEscribe[Juego.juego.indiceEscribe])
            tvPuntuacion.text = "Tu puntaje: \(Juego.juego.puntuacionEscribe)"
        }
    }
    
    @IBAction func enviar(_ sender: Any) {
        var textoAComparar = tfEscribe.text
        textoAComparar = textoAComparar!.lowercased()
        textoAComparar = textoAComparar!.replacingOccurrences(of: " ", with: "")
        
        if(selectedOption == textoAComparar && Juego.juego.intentoEscribe == 0) {
            Juego.juego.puntuacionEscribe += 10
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            nuevaPregunta()
        }
        else if (selectedOption == textoAComparar && Juego.juego.intentoEscribe == 1){
            Juego.juego.puntuacionEscribe += 5
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            nuevaPregunta()
        }
        else if (selectedOption != textoAComparar && Juego.juego.intentoEscribe == 0){
            let alert = UIAlertController(title: "Respuesta incorrecta", message: "¡Inténtalo de nuevo!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
            }))
            present(alert, animated: true, completion: nil)
            
            Juego.juego.intentoEscribe = 1
        }
        else if ((selectedOption != textoAComparar && Juego.juego.indiceEscribe == 4)){
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            nuevaPregunta()
        }
        else {
            let alert = UIAlertController(title: "Respuesta incorrecta", message: "La respuesta es: \(selectedOption). ¡Continúa jugando!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
            }))
            present(alert, animated: true, completion: nil)
            print(Juego.juego.indiceEscribe)
            Juego.juego.indiceEscribe += 1
            Juego.juego.intentoEscribe = 0
            nuevaPregunta()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaResultado = segue.destination as! ViewControllerResult
        vistaResultado.label = Juego.juego.puntuacionEscribe
        nuevaPregunta()
        Juego.juego.puntuacionEscribe = 0
        tvPuntuacion.text = "Score: \(Juego.juego.puntuacionEscribe)"
        imgPregunta.image = UIImage(named: Juego.juego.arrPreguntasEscribe[Juego.juego.indiceEscribe])
    }
    
    @IBAction func unwindResultEscribe(for segue: UIStoryboardSegue, sender: Any?){
        if(!Juego.juego.volverJugar){
            //self.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func quitaTeclado() {
        view.endEditing(true)
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
