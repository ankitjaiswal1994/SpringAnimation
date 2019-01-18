//
//  ViewController.swift
//  SpringAnimationDemo
//
//  Created by Ankit Jaiswal on 18/01/19.
//  Copyright © 2019 Ankit Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var popUpView: UIVisualEffectView!
    var originalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        popUpView.alpha = 0
        originalCenter = popUpView.center
    }

    @IBAction func syncButtonAction(_ sender: Any) {
        popUpView.transform = CGAffineTransform.init(scaleX: 0.4, y: 2)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .allowUserInteraction, animations: {
            self.popUpView.transform = .identity
        }) { (_) in
            
        }
        popUpView.alpha = 1
    }
    
    @IBAction func withoutSyncButtonAction(_ sender: Any) {
        popUpView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0)
        popUpView.center.y = popUpView.center.y - (popUpView.frame.height / 2)
        popUpView.transform = CGAffineTransform.init(rotationAngle: 1.8)

        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .allowUserInteraction, animations: {
            self.popUpView.transform = .identity
        }) { (_) in
            self.popUpView.center = self.originalCenter
            self.popUpView.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0.5)
        }
        popUpView.alpha = 1
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        popUpView.alpha = 0
    }
}

