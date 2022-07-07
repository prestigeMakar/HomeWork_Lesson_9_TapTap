//
//  CircleViewCoontroller.swift
//  HomeWork_Lesson_9_TapTap
//
//  Created by Артем Макаренко on 07.07.2022.
//

import Foundation
import UIKit

public final class CircleViewController: UIViewController {

    let circle = UIView()
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemGray
        
        //MARK: Circle Parameters
        
        let centerX = UIScreen.main.bounds.width / 2 - 50
        let centerY = UIScreen.main.bounds.height / 2 - 50
 
        circle.clipsToBounds = true
        circle.frame = CGRect(x: centerX, y: centerY, width: 100, height: 100)
        circle.layer.cornerRadius = CGFloat(50)
        circle.backgroundColor = .systemOrange
    
        view.addSubview(circle)
        
        circle.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
    }
    
    @objc func handlePanGesture(gesture:UIPanGestureRecognizer) {
        if gesture.state == .began {
            print("It's began")
        } else if gesture.state == .changed {
            let transation = gesture.translation(in: view)
            circle.transform = CGAffineTransform(translationX: transation.x, y: transation.y)
            print("It's changed")
        } else if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: .curveEaseIn, animations: {
                self.circle.transform = .identity })
            print("It's ended")
        }
    }
}
    

        
        
        
        
        
        
        
        
//        circle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        circle.heightAnchor.constraint(equalToConstant: 450).isActive = true
//        circle.widthAnchor.constraint(equalToConstant: 275).isActive = true
        
        //view.addSubview(circle)
    




//    private let circlePanGestureRecognizer = UIPanGestureRecognizer()
//    private var circlePanGestureAnchorPoint: CGPoint?

//        circlePanGestureRecognizer.addTarget(self, action: #selector(handlePanGesture(_:)))
//        circlePanGestureRecognizer.maximumNumberOfTouches = 1
//
//        view.addGestureRecognizer(circlePanGestureRecognizer)
