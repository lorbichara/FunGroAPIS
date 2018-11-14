//
//  ViewControllerResultSelecciona.swift
//  FunGro
//
//  Created by Esteban Arocha Ortuno on 11/7/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class ViewControllerResultSelecciona: UIViewController {

    var label = 0

    @IBOutlet weak var lbPuntaje: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbPuntaje.text = "Tu resultado es: \(String(label))"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCompartir(_ sender: Any) {
        // set up activity view controller
        let shareText = "Jugué FunGro en modo selecciona y mi puntaje fue: \(String(label))"
        let activityVC = UIActivityViewController(activityItems: [shareText as Any], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func menuPrincipal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
