//
//  LowerLevelVC.swift
//  ShoppingSpree
//
//  Created by anushka on 10/23/24.
//

import UIKit

class LowerLevelVC: ViewController {
    
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        containerView.isUserInteractionEnabled = true
        containerView.addGestureRecognizer(pinchGesture)
    }

    @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
        guard let view = gesture.view else { return }
        view.transform = view.transform.scaledBy(x: gesture.scale, y: gesture.scale)
        gesture.scale = 1.0
    }

}
