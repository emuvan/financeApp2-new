//
//  ThirdViewController.swift
//  financeApp2 new
//
//  Created by Van Quang Nguyen on 03/03/2020.
//  Copyright © 2020 Van Quang Nguyen. All rights reserved.
//

import UIKit

class LoansViewController: UIViewController {

    @IBOutlet weak var LoanAText: UITextField!
    @IBOutlet weak var InterestText: UITextField!
    @IBOutlet weak var fValueText: UITextField!
    @IBOutlet weak var YearsText: UITextField!
    @IBOutlet weak var TotalText: UITextField!
    
    var keyboardShown = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override  func viewDidAppear(_ animated: Bool) {
        self.LoanAText.becomeFirstResponder()
    }
    
    @IBAction func Calculate3(_ sender: Any) {
        let loan = Double((LoanAText.text! as NSString).floatValue)
        let interest = Double((InterestText.text! as NSString).floatValue)
        let fv = Double((fValueText.text! as NSString).floatValue)
        let ny = Double((YearsText.text! as NSString).floatValue)
        var tp = Double((TotalText.text! as NSString).floatValue)

        if self.TotalText.text == ""{
            var L = formulae.Saving()
            L.montlyPayment = loan
            L.interestRate = interest
            L.futureV = fv
            L.numOfYears = ny
            let LL = formulae.FV3(savingsDetail: L)
            TotalText.text = "\(LL)"
        }
            if self.InterestText.text == ""{
                var i = formulae.Saving()
                i.presentV = loan
                i.futureV = fv
                i.numOfYears = ny
                let ii = formulae.interestRate(savingsDetail: i)
                InterestText.text = "\(ii)"
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
             
