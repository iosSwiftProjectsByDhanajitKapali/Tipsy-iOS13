//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPct:Float = 0.0
    var stepperValue = 0
    var billAmount : Float = 0.0
    var perPerson : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        twentyPctBtn.isSelected = false
        
        if sender.currentTitle! == "0%"{
            zeroPctBtn.isSelected = true
            tipPct = 0.0
        }
        if sender.currentTitle! == "10%"{
            tenPctBtn.isSelected = true
            tipPct = 0.1
        }
        if sender.currentTitle! == "20%"{
            twentyPctBtn.isSelected = true
            tipPct = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)      //force closing the numpad keyboard used for inserting the bill amount
        
        stepperValue = Int(sender.value)
        splitNumberLabel.text = String(format: "%i", stepperValue)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billAmount = Float(billTextField.text!)!
        let totalBill = billAmount + (billAmount*tipPct)
        perPerson = totalBill/Float(stepperValue)
        
        //defining the segue to perform
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    //passing the data to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.perPerson = perPerson
            destinationVC.tip = tipPct
        }
    }
    
}

