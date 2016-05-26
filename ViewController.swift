//
//  ViewController.swift
//  Calculator
//
//  Created by Seth Krantzler on 1/26/16.
//  Copyright © 2016 Azure Apps. All rights reserved.
//

import UIKit
import Darwin

func degToRad(degrees: Double) -> Double {
    // M_PI is defined in Darwin.C.math
    return M_PI * 2.0 * degrees / 360.0
}

extension String {
    var binaryToInt    : Int    { return Int(strtoul(self, nil, 2))       }
}
class ViewController: UIViewController {

    @IBOutlet weak var Screen: UILabel!
    var firstNumber = Double ()
    var secondNumber =  Double ()
    var isTypingSomething = false
    var result = Double ()
    var binarystr = String()
    var binaryresult = Int()
    var binary = Int ()
    var operation = ""
    var decstring = Int ()
    
    @IBAction func dot(sender: AnyObject) {
        let deci = sender.currentTitle
        if isTypingSomething {
            Screen.text = Screen.text! + deci!!
        } else {
            Screen.text = deci!!
            isTypingSomething = true
        }
    }
    
    @IBAction func numbers(sender: AnyObject) {
        let number = sender.currentTitle
        if isTypingSomething {
            Screen.text = Screen.text! + number!!
        } else {
            Screen.text = number
        }
        isTypingSomething = true
    }
    
    
    @IBAction func operations(sender: AnyObject) {
        operation = sender.currentTitle!!
        firstNumber = (Screen.text! as NSString).doubleValue
        isTypingSomething = false
    }
    
    @IBAction func evaluate(sender: AnyObject) {
        secondNumber = (Screen.text! as NSString).doubleValue
        if operation == "+" {
            result = firstNumber + secondNumber
            firstNumber = result
            Screen.text = "\(result)"
        } else if operation == "-" {
            result = firstNumber - secondNumber
            firstNumber = result
            Screen.text = "\(result)"
        } else if operation == "X" {
            result = firstNumber * secondNumber
            firstNumber = result
            Screen.text = "\(result)"
        } else if operation == "/" {
            result = firstNumber / secondNumber
            firstNumber = result
            Screen.text = "\(result)"
        } else if operation == "%" {
            result = firstNumber % secondNumber
            firstNumber = result
            Screen.text = "\(result)"
        } else if operation == "√" {
            result = sqrt(firstNumber)
            firstNumber = result
            Screen.text = "\(result)"
        } else if operation == "Sin" {
            result = sin(degToRad(firstNumber))
            if result < 0.000001 {
                result = 0
            }
            firstNumber = result
            Screen.text = "\(result)"
        } else if operation == "Cos" {
            result = cos(degToRad(firstNumber))
            if result < 0.000001 {
                result = 0
            }
            firstNumber = result
            Screen.text = "\(result)"
        } else if operation == "^" {
            result = pow(firstNumber,secondNumber)
            firstNumber = result
            Screen.text = "\(result)"
        } else if operation == "Dec" {
            Screen.text = "\(String(firstNumber).binaryToInt)"
            
        } else if operation == "Bin" {
            binarystr = String (Int(firstNumber), radix: 2)
            binaryresult = Int(binarystr)!
            Screen.text = "\(binaryresult)"
        }
    }
    
    @IBAction func allclear(sender: AnyObject) {
        firstNumber = 0
        secondNumber = 0
        Screen.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

