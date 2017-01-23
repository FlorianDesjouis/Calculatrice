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
        let text = display.text ?? ""
        display.text = text + String(sender.tag)
    }
    
    @IBAction func substract(sender: UIButton) {
        let text = display.text ?? "0"
        calculator.add(Int(text)!, operation: .substraction)
        display.text = "-"
    }
    @IBAction func addition(_ sender: UIButton) {
        let text = display.text ?? "0"
        calculator.add(Int(text)!, operation: .addition)
        display.text = "+"
    }
    
    @IBAction func resultat(sender: UIButton) {
        let text = display.text ?? "0"
        calculator.result(Int(text)!)
        display.text = calculator.actualDisplay()
    }
    
    @IBAction func clear(sender: UIButton) {
        calculator.clear()
        display.text = ""
        print("Clear Result")
    }
    
}
//MARK : Operation handled
enum Operator {
    case addition
    case substraction
}
//MARK : Calculator Model
class Calculator {
    var firstNumber: Int = 0
    var operation: Operator?
    
    func add(number: Int, operation: Operator) {
        firstNumber = number
        self.operation = operation
    }
    
    func isCalculating() -> Bool {
        return (operation != nil)
    }
    
    func clear() {
        self.operation = nil
        self.firstNumber = 0
    }
    
    func result(otherNumber: Int) {
        if let opp = operation {
            switch opp {
            case .addition:
                firstNumber = addition(firstNumber, second: otherNumber)
            case .substraction:
                firstNumber = substraction(firstNumber, second: otherNumber)
            }
        }
    }
    
    func actualDisplay() -> String {
        return "\(firstNumber)"
    }
    
    // MARK: != Operation
    private func addition(first: Int, second: Int) -> Int {
        return first + second
    }
    
    private func substraction(first: Int, second: Int) -> Int {
        return first - second
    }
}
