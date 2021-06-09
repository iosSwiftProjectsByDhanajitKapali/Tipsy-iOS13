//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by unthinkable-mac-0025 on 14/03/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var perPerson : Float = 0.0
    var personNumber = 0
    var tip : Float = 0.0
    
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalLabel.text = String(format: "%.2f", perPerson)
        settingsLabel.text = "Split between \(personNumber) people, with \(tip*100)% tip"
    }
    

    @IBAction func recalculateBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)   //moving back to screen where we came from
    }
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
