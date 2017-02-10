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
    
    // Handle only one digit
    @IBAction func touchNumber(_ sender: UIButton) {
        if calculator.isCalculating() {
            calculator.result(sender.tag)
        } else {
            calculator.add(number: sender.tag)
        }
        display.text = String(sender.tag)
    }
    
    @IBAction func substract(_ sender: UIButton) {
        calculator.add(operation: .substraction)
        display.text = "-"
    }
    @IBAction func addition(_ sender: UIButton) {
        calculator.add(operation: .addition)
        display.text = "+"
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        calculator.add(operation: .multiply)
        display.text = "x"
    }
    
    @IBAction func divide(_ sender: UIButton) {
        calculator.add(operation: .divide)

        display.text = "/"
    }
    
    @IBAction func resultat(_ sender: UIButton) {
        display.text = calculator.actualDisplay()
    }
    
    @IBAction func clear(_ sender: UIButton) {
        calculator.clear()
        display.text = ""
        print("Clear Result")
    }
    
}
//MARK : Operation handled
enum Operator {
    case addition
    case substraction
    case multiply
    case divide
}
//MARK : Calculator Model
class Calculator {
    var firstNumber: Int = 0
    var operation: Operator?
    
    func add(number: Int) {
        firstNumber = number
    }
    
    func add(operation: Operator) {
        self.operation = operation
    }
    
    func isCalculating() -> Bool {
        return (operation != nil)
    }
    
    func clear() {
        self.operation = nil
        self.firstNumber = 0
    }
    
    func result(_ otherNumber: Int) {
        if let opp = operation {
            switch opp {
            case .addition:
                firstNumber = addition(firstNumber, second: otherNumber)
            case .substraction:
                firstNumber = substraction(firstNumber, second: otherNumber)
            case .multiply:
                firstNumber = multiply(firstNumber, second: otherNumber)
            case .divide:
            firstNumber = divide(firstNumber, second: otherNumber)
        }
        }
    }
    
    func actualDisplay() -> String {
        return "\(firstNumber)"
    }
    
    // MARK: != Operation
    fileprivate func addition(_ first: Int, second: Int) -> Int {
        return first + second
    }
    
    fileprivate func substraction(_ first: Int, second: Int) -> Int {
        return first - second
    }
    
    fileprivate func multiply(_ first: Int, second: Int) -> Int {
        return first * second
    }

    fileprivate func divide(_ first: Int, second: Int) -> Int {
        var divided = Int();
        if first == 0 {
            print("cannot divide by 0")
        }else if second == 0 {
            print("cannot divide by 0")
        }else{
         divided = first / second
        }
        return divided
}

}
