//
//  ViewController.swift
//  Ifood
//
//  Created by Abdelrahman ElJazzar on 3/1/18.
//  Copyright © 2018 Abdelrahman ElJazzar. All rights reserved.
//

import UIKit
import Cosmos

class RateAndReviewController: UIViewController , UITextViewDelegate{
    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var rateView: CosmosView!
    
    @IBOutlet weak var feedbackText: UITextView!
    @IBOutlet weak var resturantTitle: UILabel!
    @IBOutlet weak var mealImage: UIImageView!

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        feedbackText.text = "enter your feedback"
        feedbackText.textColor = UIColor.lightGray
        initView ()
    }

 
    @IBAction func closePopUpPressed(_ sender: Any) {
        // dismss the view
    }
    func initView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        
        view.addGestureRecognizer(tap)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        feedbackText.delegate = self
        mealImage.layer.cornerRadius = 10
        mealImage.clipsToBounds = false
        mealImage.layer.masksToBounds = true
        feedbackText.layer.cornerRadius = 8
        feedbackText.clipsToBounds = true
        sendButton.layer.cornerRadius = 8
        sendButton.layer.masksToBounds = false
        mealImage.dropShadow()
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "enter your feedback"
            textView.textColor = UIColor.lightGray
        }
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
   

}
fileprivate extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}


