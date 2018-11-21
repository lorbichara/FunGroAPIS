//
//  Juego.swift
//  FunGro
//
//  Created by Lorraine Bichara Assad on 11/4/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class Juego: Codable {
    static var juego = Juego()
    
    var arrPreguntasEscribe = [String]()
    var arrPreguntasSelecciona = [String]()
    var puntuacionEscribe : Int
    var puntuacionSelecciona : Int
    var indiceEscribe : Int
    var indiceSelecciona : Int
    var intentoEscribe : Int
    var intentoSelecciona : Int
    var volverJugar : Bool
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("juego")
    
    init(arrPreguntasEscribe : [String], arrPreguntasSelecciona : [String], puntuacionEscribe : Int, puntuacionSelecciona : Int, indiceEscribe : Int, indiceSelecciona : Int) {
        self.puntuacionEscribe = puntuacionEscribe
        self.puntuacionSelecciona = puntuacionSelecciona
        self.arrPreguntasEscribe = ["acidocarboxilico", "alcano", "alcohol", "aldehido", "alqueno", "alquino", "amida", "amina", "anhidrido","cetona", "ester", "eter", "fenilo", "haluro", "nitrilo", "nitro"]
        self.arrPreguntasSelecciona = ["acidocarboxilico", "alcano", "alcohol", "aldehido", "alqueno", "alquino", "amida", "amina", "anhidrido","cetona", "ester", "eter", "fenilo", "haluro", "nitrilo", "nitro"]
        self.arrPreguntasEscribe.shuffle()
        self.arrPreguntasSelecciona.shuffle()
        self.indiceEscribe = indiceEscribe
        self.indiceSelecciona = indiceSelecciona
        self.intentoEscribe = 0
        self.intentoSelecciona = 0
        self.volverJugar = false
    }
    
    init() {
        self.puntuacionEscribe = 0
        self.puntuacionSelecciona = 0
        self.arrPreguntasEscribe = ["acidocarboxilico", "alcano", "alcohol", "aldehido", "alqueno", "alquino", "amida", "amina", "anhidrido","cetona", "ester", "eter", "fenilo", "haluro", "nitrilo", "nitro"]
        self.arrPreguntasSelecciona = ["acidocarboxilico", "alcano", "alcohol", "aldehido", "alqueno", "alquino", "amida", "amina", "anhidrido","cetona", "ester", "eter", "fenilo", "haluro", "nitrilo", "nitro"]
        self.arrPreguntasEscribe.shuffle()
        self.arrPreguntasSelecciona.shuffle()
        self.indiceEscribe = 0
        self.indiceSelecciona = 0
        self.intentoEscribe = 0
        self.intentoSelecciona = 0
        self.volverJugar = false
    }
    
    //persistencia de juego
    func guardaJuego() {
        do{
            let data = try PropertyListEncoder().encode(Juego.juego)
            let success = NSKeyedArchiver.archiveRootObject(data, toFile: Juego.ArchiveURL.path)
            print(success ? "Successfull save" : "Save failed")
        } catch{
            print("Save failed")
        }
    }
    
    //recuperar información
    func retrieveJuego() {
        guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: Juego.ArchiveURL.path) as? Data else {return}
        do {
            Juego.juego = try PropertyListDecoder().decode(Juego.self, from: data)
        } catch {
            print("No se pudo recuperar la información del juego")
        }
    }
    
    
    
    
    

}
