//
//  ViewControllerMenu.swift
//  FunGro
//
//  Created by Clarissa Miranda on 11/19/18.
//  Copyright © 2018 Lorraine Bichara Assad. All rights reserved.
//

import UIKit

class ViewControllerMenu: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "FunGro"
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
