//
//  FirstViewController.swift
//  financeApp2 new
//
//  Created by Van Quang Nguyen on 24/02/2020.
//  Copyright © 2020 Van Quang Nguyen. All rights reserved.
//

import UIKit

class SavingsViewController: UIViewController {
// connecting the element from the UI of the iphone
    @IBOutlet weak var PresentAmount: UITextField!
    @IBOutlet weak var Interest: UITextField!
    @IBOutlet weak var FutureValue: UITextField!
    @IBOutlet weak var NoYear: UITextField!
    @IBOutlet weak var CompoundYear: UITextField!
    @IBOutlet weak var Paymentyear: UITextField!
    @IBOutlet weak var Totalpayment: UITextField!
    
    var keyboardShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    //creating a function of keyyboard appearance when present amount tex bar is selected
    override  func viewDidAppear(_ animated: Bool) {
        self.PresentAmount.becomeFirstResponder()
    }

    // gathering the intormation from the user and declaring the variables. it is the function for the button
    @IBAction func Calculate1(_ sender: UIButton) {
        var amnt = Double((PresentAmount.text! as NSString).floatValue)
        var interest = Double((Interest.text! as NSString).floatValue)
        var fv = Double((FutureValue.text! as NSString).floatValue)
        var ny = Double((NoYear.text! as NSString).floatValue)
        var py = Double((Paymentyear.text! as NSString).floatValue)
        var tp = Double((Totalpayment.text! as NSString).floatValue)
        
        // total payment textfield is empty it will bring out the results for the total payment and uses the priciple amount calculation from the formula. inherited from the saving struct
        if self.Totalpayment.text == "" {
            var s = formulae.Saving()
            s.interestRate = interest
            s.montlyPayment = amnt
            s.numOfYears = ny
            s.futureV = fv
            var SV : Double = formulae.principleAmount(savingsDetail: s)
            Totalpayment.text = "\(SV)"
        }
        //interest rate method if textfield is empty
        if self.Interest.text == ""{
            var i = formulae.Saving()
            i.presentV = amnt
            i.futureV = fv
            i.numOfYears = ny
            var ii : Double = formulae.interestRate(savingsDetail: i)
            var decimal = ii*100
            Interest.text = "\(decimal)"
        }
        //future value method
        if self.FutureValue.text == ""{
            var f = formulae.Saving()
            f.interestRate = interest
            f.numOfYears = ny
            var ff : Double = formulae.FV(savingsDetail: f)
            FutureValue.text = "\(ff)"
            
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
