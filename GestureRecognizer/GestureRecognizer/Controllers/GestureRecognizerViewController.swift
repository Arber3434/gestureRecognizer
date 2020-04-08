//
//  GestureRecognizerViewController.swift
//  GestureRecognizer
//
//  Created by Cacttus Education 09 on 4/8/20.
//  Copyright © 2020 Cacttus Education. All rights reserved.
//

import UIKit

class GestureRecognizerViewController: UIViewController {
    
    @IBOutlet weak var viewToTransform: UIView!
    
    override func viewDidLoad() {
                super.viewDidLoad()
                addTapGestureRecognizer()
     }
            
 func addTapGestureRecognizer(){
      let tap = UITapGestureRecognizer(target: self, action: #selector(handleViewToTransformTap))
        self.view.addGestureRecognizer(tap)
            }
            
func addLongPressGestureRecognizer(){
     let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleTap))
                self.view.addGestureRecognizer(longPress)
            }
            
@objc func handleTap(){
       self.view.endEditing(true)
          addAnimation()
   }
            
func showAlert() {
     let alert = UIAlertController(title: "Hello!", message: "This is a tap!", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
                    (handler) in
                }))
                
      self.present(alert, animated:true)
  }
                   
  func addAnimation() {
       UIView.animate(withDuration: 2.0, animations: {
            self.view.backgroundColor = .systemBlue
                    }) { (true) in
       UIView.animate(withDuration: 2.0) {
            self.view.backgroundColor = .systemGray
           }
       }
    }
            
func addTapRecognizerToViewToTransform() {
      let tap = UITapGestureRecognizer(target: self, action: #selector(handleViewToTransformTap))
    viewToTransform.addGestureRecognizer(tap)
            }
    
@objc func handleViewToTransformTap(){
    transformView()
    UIView.animate(withDuration: 2.0, animations: {
        self.viewToTransform.frame = CGRect(x: self.view.center.x - 50, y: self.view.center.y - 50, width: 100, height: 100)
    }) { (true) in
        
    }
}
    
    func transformView() {
        UIView.animate(withDuration: 2.0, animations: {
            self.viewToTransform.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }) { (true) in
            UIView.animate(withDuration: 3.0, animations: {
                self.viewToTransform.transform = CGAffineTransform.identity
            })
        }
    }
}
