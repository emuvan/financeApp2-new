//
//  SecondViewController.swift
//  financeApp2 new
//
//  Created by Van Quang Nguyen on 24/02/2020.
//  Copyright © 2020 Van Quang Nguyen. All rights reserved.
//

import UIKit

class MortgageViewController: UIViewController {

    
    @IBOutlet weak var AmountText: UITextField!
    @IBOutlet weak var InterestText: UITextField!
    @IBOutlet weak var YearsText: UITextField!
    @IBOutlet weak var PaymentText: UITextField!
    
     var keyboardShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    override  func viewDidAppear(_ animated: Bool) {
        self.AmountText.becomeFirstResponder()
    }
    
    @IBAction func CButton2(_ sender: Any) {
       var amnt = Double((AmountText.text! as NSString).floatValue)
        var I = Double((InterestText.text! as NSString).floatValue)
        var Y = Double((YearsText.text! as NSString).floatValue)
        var T = Double((PaymentText.text! as NSString).floatValue)

        if self.PaymentText.text == "" {
            var m = formulae.Mortgage()
            m.interestRate = I
            m.loanAmount = amnt
            m.numOfYears = Y
            var MM : Double = formulae.calculateMortgage(mortgageDetail: m)
            PaymentText.text = "\(MM)"
        
            
        }
        if self.InterestText.text == "" {
            var i = formulae.Saving()
            i.presentV = amnt
            i.numOfYears = Y
            i.futureV = T
            var II : Double = formulae.interestRate(savingsDetail: i)
            var decimalInterest = II*100
            InterestText.text = "\(decimalInterest)"
            
    }
        if self.YearsText.text == ""{
            var t = formulae.Mortgage()
            t.interestRate = I
            t.loanAmount = amnt
            var tt : Double = formulae.MortgageLT(mortgageDetail: t)
            var length = tt * 1000
            YearsText.text = "\(length)"
        }
    
    
}
  var keyBoardHeight:CGFloat = 0.0
     //MARK: - keyboard handling code
      override func viewWillAppear(_ animated: Bool) {
      NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)),
     name: .UIKeyboardWillShow, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)),
         name: .UIKeyboardWillHide, object: nil)
         if(keyboardShown){
             var tabBarFrame : CGRect = CGRect(x: self.view.frame.maxX, y: self.view.frame.maxY, width:
                 self.view.frame.width, height: 30.0)
             tabBarFrame.origin.y = self.view.frame.maxY
             self.tabBarController?.tabBar.frame = tabBarFrame
         }
     }
     
     @objc func keyboardWillHide(notification: NSNotification) {
            if(!keyboardShown){
             var tabBarFrame : CGRect = CGRect(x: self.view.frame.maxX, y: self.view.frame.maxY, width:
                            self.view.frame.width, height: 30.0)
                        tabBarFrame.origin.y = self.view.frame.maxY
                        self.tabBarController?.tabBar.frame = tabBarFrame
         }
     }
     @objc func keyboardWillShow(notification: NSNotification) {
         if(!keyboardShown){
             
             
         
      //this moves the tab bar above the keyboard for all devices

      if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as?
     NSValue)?.cgRectValue {
      self.keyBoardHeight = keyboardSize.origin.y - keyboardSize.height -
     (self.tabBarController?.tabBar.frame.height)!
      }
         }
         // tabBarMoved = true
         var tabBarFrame: CGRect = (self.tabBarController?.tabBar.frame)!
         tabBarFrame.origin.y = self.keyBoardHeight
         UIView.animate(withDuration: 0.25, animations: {() -> Void in
         self.tabBarController?.tabBar.frame = tabBarFrame
         })
         keyboardShown = true
         }
     
 }
          
