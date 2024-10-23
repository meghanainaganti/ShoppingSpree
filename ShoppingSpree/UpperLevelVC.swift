//
//  UpperLevelVC.swift
//  ShoppingSpree
//
//  Created by anushka on 10/23/24.
//

import UIKit

class UpperLevelVC: ViewController {
    
    @IBOutlet weak var containerViewUpper: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        containerViewUpper.isUserInteractionEnabled = true
        containerViewUpper.addGestureRecognizer(pinchGesture)
    }

    @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let view = gesture.view else { return }
        view.transform = view.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        gesture.scale = 1.0
    }
}
