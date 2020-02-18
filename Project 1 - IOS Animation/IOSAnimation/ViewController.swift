//
//  ViewController.swift
//  IOSAnimation
//
//  Created by Dantavious Williams on 2/17/20.
//  Copyright © 2020 Dantavious Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        button.setTitle("Hello?", for: .normal)
        let constraints = [
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60),
        ]
        
        NSLayoutConstraint.activate(constraints)
        button.addTarget(self, action: #selector(self.button), for: .touchUpInside)
        
    }
    
    @objc func button(sender:UIButton) {
        print("Google is everything!")
        self.animateView(sender)
        
        sender.alpha = 0.0
        
        let label =  UILabel()
        label.text = "Hello"
        label.font = UIFont.systemFont(ofSize: 72)
        label.textColor = UIColor.init(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        label.sizeToFit()
        label.center = CGPoint(x: 100, y: -70)
        view.addSubview(label)
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: [], animations: {
            label.center = CGPoint(x: 200, y: 200)
        }, completion: nil)
        
        let l2 = UILabel()
        l2.text = "I'm N4N0, a new Swift Developer"
        l2.font = UIFont.systemFont(ofSize: 24)
        l2.textColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        l2.sizeToFit()
        l2.center = CGPoint(x: 100, y: -70)
        view.addSubview(l2)
        
        UIView.animate(withDuration: 3.0, delay: 1.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [], animations: {
            l2.center = CGPoint(x: 200, y: 90 + 170)
            l2.alpha = 1
            }) {(_) -> Void in

                label.alpha = 0.0

                let animation = CATransition()
                animation.duration = 1.0
                animation.type = CATransitionType.fade
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
                l2.layer.add(animation, forKey: "changeTextTransition")
                l2.text = "Welcome to my project"
                l2.font = UIFont.boldSystemFont(ofSize: 30)
                l2.center = CGPoint(x: 225, y: 90 + 200)
                l2.sizeToFit()
        }
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

