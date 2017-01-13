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
    
    @IBAction func addtion(sender: UIButton) {
        
    }
    @IBAction func touchNumber(sender: UIButton) {
        print("User touched button \(sender.tag)")
        display.text = display.text! + "\(sender.tag)"
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

