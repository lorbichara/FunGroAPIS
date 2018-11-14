//
//  ViewControllerResult.swift
//  FunGro
//
//  Created by Lorraine Bichara Assad on 11/4/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class ViewControllerResult: UIViewController {

    var label = 0
    @IBOutlet weak var lbPuntaje: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbPuntaje.text = "Tu resultado es: \(String(label))"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCompartir(_ sender: Any) {
        
       // let image = UIImage(named: "alqueno")
        
        // set up activity view controller
        let shareText = "Jugué FunGro en modo escribe y mi puntaje fue: \(String(label))"
        let activityVC = UIActivityViewController(activityItems: [shareText as Any], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
    @IBAction func menuPrincipal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
