//
//  ViewController.swift
//  bin2dec
//
//  Created by Nana Adwoa Odeibea Amoah on 7/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var convertedLabel: UILabel!
    
    var result = 0
    
    @IBAction func convertButton(_ sender: Any) {
        var inputString = inputTextField.text ?? ""
        for (i, num) in inputString.enumerated(){
            let intAtPosition = Int(String(num)) ?? 0
            result = result + (intAtPosition * Int(pow(2, Double((inputString.count - 1) - i))))
        }
        
        convertedLabel.text = "Decimal Value: " + String(result)
        result = 0
        inputString = ""
        
        
//Using arrays
//        var inputArray = Array(inputTextField.text ?? "")
//        for (i, num) in inputArray.enumerated(){
//            let intAtPostion = Int(String(num)) ?? 0
//            result = result + (intAtPostion * Int(pow(2, Double((inputArray.count - 1) - i))))
//        }
//
//        convertedLabel.text = "Decimal Value: " + String(result)
//        result = 0
//        inputArray.removeAll()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

