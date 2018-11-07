//
//  ViewController.swift
//  FunGro
//
//  Created by Lorraine Bichara Assad on 11/4/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var elemento: UITextField!
    @IBOutlet weak var posiblesRespuestas: UIPickerView!
    @IBOutlet weak var respuesta: UIImageView!
    @IBOutlet weak var score: UITextField!
    
    var indImg = 0
    var selectedOption = ""
    var imgArr = [String]()
    //var imgArr = ["alcano", "alqueno", "alquino","amidas", "aminas", "cetonas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.posiblesRespuestas.delegate = self
        self.posiblesRespuestas.dataSource = self
        nuevaPregunta()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imgArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 110, height: 60))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        imageView.image = UIImage(named: imgArr[row])
        view.addSubview(imageView)
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedOption = imgArr[row]
        respuesta.image = UIImage(named: imgArr[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 300
    }

    func getPickerOptions() -> [String] {
        var arrPicker = Juego.juego.arrPreguntasSelecciona
        arrPicker.remove(at: Juego.juego.indiceSelecciona)
        arrPicker.shuffle()
        arrPicker = Array(arrPicker.prefix(4))
        arrPicker.append(Juego.juego.arrPreguntasSelecciona[Juego.juego.indiceSelecciona])
        arrPicker.shuffle()
        return arrPicker
    }
    
    @IBAction func btnEnviar(_ sender: Any) {
        if(selectedOption == elemento.text && Juego.juego.intento == 0) {
            let alert = UIAlertController(title: "Respuesta correcta", message: "Siguiente pregunta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
                self.navigationController?.popViewController(animated: true)
            }))
            
            Juego.juego.puntuacionSelecciona += 10
            Juego.juego.indiceSelecciona += 1
            Juego.juego.intento = 0
            nuevaPregunta()
        }
        else if (selectedOption == elemento.text && Juego.juego.intento == 1){
            let alert = UIAlertController(title: "Respuesta correcta", message: "Siguiente pregunta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
                self.navigationController?.popViewController(animated: true)
            }))
            
            Juego.juego.puntuacionSelecciona += 5
            Juego.juego.indiceSelecciona += 1
            Juego.juego.intento = 0
            nuevaPregunta()
        }
        else if (selectedOption != elemento.text && Juego.juego.intento == 0){
            let alert = UIAlertController(title: "Respuesta incorrecta", message: "¡Inténtalo de nuevo!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
            
            Juego.juego.intento = 1
        }
        else {
            let alert = UIAlertController(title: "Respuesta incorrecta", message: "Siguiente pregunta", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(alert: UIAlertAction!) in print("Foo")
                self.navigationController?.popViewController(animated: true)
            }))
            present(alert, animated: true, completion: nil)
            
            Juego.juego.indiceSelecciona += 1
            Juego.juego.intento = 0
            nuevaPregunta()
        }
    }
    
    func nuevaPregunta() {
        if(Juego.juego.indiceSelecciona == 5) { //SI HAY MAS GRUPOS ESTA CONDICIÓN CAMBIA
            self.performSegue(withIdentifier: "resultadoSelecciona", sender: self)
        }
        else{
            imgArr = getPickerOptions()
            respuesta.image = UIImage(named: imgArr[0])
            score.text = "Score: \(Juego.juego.puntuacionSelecciona)"
            elemento.text = Juego.juego.arrPreguntasSelecciona[Juego.juego.indiceSelecciona]
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaResultado = segue.destination as! ViewControllerResult
        vistaResultado.label = Juego.juego.puntuacionSelecciona
    }
    

}

