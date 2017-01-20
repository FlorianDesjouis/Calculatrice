//
//  ViewController.swift
//  Calculatrice
//
//  Created by SUP'Internet 09 on 13/01/2017.
//  Copyright © 2017 SUP'Internet 09. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController{
    
    @IBOutlet weak var display: UILabel!
    
    
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//MARK : User Action
extension CalculatorViewController {
    
    @IBAction func Result(_ sender: Any) {
        print("result")
        calculator.result(sender.tag)
    }
    
    @IBAction func substract(sender: UIButton) {
        print("-")
        calculator.add(.soustraction)
        display.text = "-"
    }
    @IBAction func addition(sender: UIButton) {
        print("+")
        calculator.add(.addition)
        display.text = "+"
    }
    
    @IBAction func clear(_ sender: Any) {
        display.text = ""
        print("clear")
    }
    
    @IBAction func touchNumber(sender: UIButton) {
        
        calculator.add(sender.tag)
        display.text = String(sender.tag)
    }
}
//MARK : Operation handled
enum Operator {
    case addition
    case soustraction
}
//MARK : Calculator Model
class Calculator {
    var firstNumber: Int = 0
    
    func add(number: Int) {
        firstNumber = number
    }
    
    func add(operation: Operator) {
        self.operation = operation
    }
    
    func isCalculating() -> Bool {
        return operation != nil
    }
    
    func actualDisplay() -> String {
        return ""
    }
    private func addition(first: Int, second: Int) {
        
    }
    
    private func soustraction() {
        
    }
    
    private func result(otherNumber: Int) {
        if let opp = operation {
            switch operation {
                case .addition:
                    addition(firstNumber, second:otherNumber)
                case .soustraction:
                    soustraction()
                case .result:
                    result()
                case .clear:
                    clear()
            }
        }
    }
    
    private func clear() {
        self.operation = nil
        self.firstNumber = 0
    }
}

