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
        Juego.juego.volverJugar = false
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func voverJugar(_ sender: Any) {
        Juego.juego.volverJugar = true
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let firstImageView = UIImageView(image: UIImage(named: "Diapositiva0.png"))
        firstImageView.frame = view.frame
        view.addSubview(firstImageView)
        view.sendSubviewToBack(firstImageView)
        
        imageFadeIn(imageView: firstImageView,iX: 1)
    }
    
    func imageFadeIn(imageView: UIImageView, iX:Int) {
        if(iX<7)
        {
            let secondImageView = UIImageView(image: UIImage(named: "Diapositiva\(iX).png"))
            secondImageView.frame = view.frame
            secondImageView.alpha = 0.0
            
            view.insertSubview(secondImageView, aboveSubview: imageView)
            
            UIView.animate(withDuration: 1.0, delay: 0.3, options: .curveEaseOut, animations: {
                secondImageView.alpha = 1.0
            }, completion: {_ in
                imageView.image = secondImageView.image
                self.imageFadeIn(imageView: secondImageView,iX: iX+1)
            })
        }
    }
}
