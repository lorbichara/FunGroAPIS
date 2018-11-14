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

    //Share functionality (specific for iPad)
    @IBAction func btnCompartir(_ sender: Any) {
        let shareText = "Jugué FunGro en modo escribe y mi puntaje fue: \(String(label))"
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        
        activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
        activityViewController.popoverPresentationController?.permittedArrowDirections = []
        activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
    
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    @IBAction func menuPrincipal(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
