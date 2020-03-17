//
//  formulae.swift
//  financeApp2 new
//
//  Created by Van Quang Nguyen on 24/02/2020.
//  Copyright © 2020 Van Quang Nguyen. All rights reserved.
//

import Foundation

var n = 12.0
var r = 0.032
var t = 10.0
var p = 1000.0
var xx = pow((1+r/n),n*t)
var domn = xx-1
var num = p*(r/n)*xx

var pmt = num/domn


//classes are references
class formulae{
    
    
    //structs store or the value types
    public struct Mortgage
    {
        var loanAmount:Double = 1000.0
        var interestRate: Double = 0.032
        var numOfYears: Double = 12.0
        var yy : Double = 0.0
        var domain = 0.0
    }
    
    public struct Saving
    {
        var interestRate: Double = 0.032
        var montlyPayment: Double = 50.0
        var numOfYears: Double = 12.0
        var yy2 : Double = 0.0
        var domain2 = 0.0
        var futureV : Double = 0.0
        var presentV : Double = 0.0
    }
    
    
    //the formula for mortgage and its using the values from the mortgage struct to do the calculation
    class func calculateMortgage(mortgageDetail:Mortgage)-> Double
    {  let decimalInterest = mortgageDetail.interestRate/100
       let  yy =  pow((1+decimalInterest/n),n*mortgageDetail.numOfYears)
       let domain = yy-1
    return (yy*mortgageDetail.loanAmount*(decimalInterest/12))/domain
        
        }
    //saving forcula and using the saving struct values
    class func calculateSavings(savingsDetail:Saving)-> Double{
        let decimalInterest2 = savingsDetail.interestRate/100
         let  yy2 = pow((1+decimalInterest2/12),12*savingsDetail.numOfYears) - 1
        let   domain2 = decimalInterest2/12
           let a = pmt * (yy2/domain2)
           return a
       }
    
    //interest rate
    class func interestRate(savingsDetail:Saving)-> Double{
        let amount = savingsDetail.futureV/savingsDetail.presentV
        return n*(pow(amount,1/(n*savingsDetail.numOfYears))-1)
        
    }
    //principle Amount
    class func principleAmount(savingsDetail:Saving)-> Double{
        let decimalInterest3 = savingsDetail.interestRate/100
        let Pounds = savingsDetail.futureV
        let xx2 = pow((1+decimalInterest3/12),n*savingsDetail.numOfYears)
        return Pounds/xx2
    }
    class func FormulaTime(savingsDetail:Saving)-> Double{
        let decimalInterest4 = savingsDetail.interestRate/100
        var top = log(savingsDetail.futureV/savingsDetail.presentV)
        var bot = log(1+decimalInterest4/12)*12
        return top/bot
        
    }
    //future value
    class func FV(savingsDetail:Saving)-> Double{
        let decimalInterest5 = savingsDetail.interestRate/100
        var xx3 = pow((1+decimalInterest5/12),n*savingsDetail.numOfYears)
        var TT =  xx3 - 1
        var bb = decimalInterest5/12
        var Bracket = TT/bb
        return pmt * Bracket
    }
    //payment
    class func Payment(savingsDetail:Saving)-> Double{
        var top2 = savingsDetail.futureV
        var xx4 =  pow((1+savingsDetail.interestRate/12),n*savingsDetail.numOfYears)
        var TT2 = xx4 - 1
        var bb2 = savingsDetail.interestRate/12
        var Bracket2 = TT2/bb2
        return top2/Bracket2
    }
    
    //certain future value
    class func Cfuturevalue(savingsDetail:Saving)-> Double{
        var mt = savingsDetail.futureV * savingsDetail.interestRate
        var mt2 = 12 * pmt
        var mt3 = 12 * pmt
        var topNum = mt + mt2
        var fract = topNum/mt3
        var WT = log(fract)
        var bt = savingsDetail.interestRate + 12
        var fract2 = log(bt/12)
        var WB = 12 * fract2
        return WT/WB
    }
    
    //future value 2
    class func FV2(savingsDetail:Saving)-> Double{
        var xx5 =  pow((1+savingsDetail.interestRate/12),n*savingsDetail.numOfYears)
        var TT2 = xx5 - 1
        var bb3 = savingsDetail.interestRate/12
        var Bracket3 = TT2/bb3
        var rr =  1+savingsDetail.interestRate/12
        return pmt * Bracket3 * rr
    }
    //future value 3
    class func FV3(savingsDetail:Saving)-> Double{
        var top2 = savingsDetail.futureV
        var xx6 = pow((1+savingsDetail.interestRate/12),n*savingsDetail.numOfYears)
        var TT3 = xx6 - 1
        var bb4 = savingsDetail.interestRate/12
        var fract3 = TT3/bb4
        var rr2 =  1+savingsDetail.interestRate/12
        var WB2 = fract3 * rr2
        return top2/WB2
    }
     //future value 4
    class func FV4(savingsDetail:Saving)-> Double{
        //top of the equation
        var mt4 = savingsDetail.futureV + pmt
        var mt4p2 = savingsDetail.interestRate
        var wmt = mt4 * mt4p2
        var wt5 = 12 * pmt
         var WT1 = wmt + wt5
        var Bracket4 = savingsDetail.interestRate + 12
        var WT2 = pmt * Bracket4
        var fract4 = WT1/WT2
        //bottom part of the equation
        var num1 = log(fract4)
        var mb = savingsDetail.interestRate + 12
        var mbp2 = 12
        var mfb = mb/12
        var ln = log(mfb)
        var bb5 = 12 * ln
        //result
        return fract4/bb5
        
    }
    //mortgage length of time
    class func MortgageLT(mortgageDetail:Mortgage)-> Double{
        let decimalInterest6 = mortgageDetail.interestRate/100
        var x1 = -1*(12*pmt)
        var x2 = (mortgageDetail.loanAmount*decimalInterest6) - (12*pmt)
        var x = x1/x2
        var xw = log(x)
        var y1 = decimalInterest6+12
        var y2 = (decimalInterest6+12)/12
        var y = y1/y2
        var yw = 12 * log(y)
        return xw/yw
    }
    

}

