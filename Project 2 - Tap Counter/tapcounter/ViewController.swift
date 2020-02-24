//
//  ViewController.swift
//  tapcounter
//
//  Created by Dantavious Williams on 2/18/20.
//  Copyright © 2020 Dantavious Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var L1: UILabel!
    @IBOutlet weak var hLbl: UILabel!
    
    var counter = 0
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        button.setTitle("Tap", for: .normal)
        let constraints = [
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60),
        ]
        
        NSLayoutConstraint.activate(constraints)
        button.addTarget(self, action: #selector(self.button), for: .touchUpInside)
        
        let rLbl = UILabel()
        rLbl.text = "Reset"
        rLbl.font = UIFont.systemFont(ofSize: 12)
        rLbl.textColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        rLbl.sizeToFit()
        rLbl.center = CGPoint(x: 207, y: 835)
        rLbl.isUserInteractionEnabled = true
        view.addSubview(rLbl)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedLabel(tapGestureRecognizer:)))
        rLbl.addGestureRecognizer(tapGesture)
    }
    
    @objc func tappedLabel(tapGestureRecognizer: UITapGestureRecognizer) {
        counter = 0
        L1.text = "\(counter)"
    }
    
    @objc func button(sender:UIButton) {
        self.animateView(sender)
        
        counter += 1
        L1.text = "\(counter)"
    }
    
    fileprivate func animateView(_ viewToAnimate:UIView) {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
            
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }


}

