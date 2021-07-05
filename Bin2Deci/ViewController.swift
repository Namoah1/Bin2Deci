//
//  ViewController.swift
//  bin2dec
//
//  Created by Nana Adwoa Odeibea Amoah on 7/4/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var convertedLabel: UILabel!
    @IBOutlet weak var binDecSegmentedControl: UISegmentedControl!
    
    var result = 0
    let allowedInput = CharacterSet(charactersIn:"01").inverted
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
        
        var filteredBool = false
        let currentText = textField.text ?? ""
        let components = string.components(separatedBy: allowedInput)
        let filtered = components.joined(separator: "")
        let newString = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        if string == filtered{
            filteredBool = true
        }else{
            filteredBool = false
        }

        return filteredBool && newString.count <= 8

    }
    
    
    
    @IBAction func convertButton(_ sender: Any) {
        var inputString = inputTextField.text ?? ""
        for (i, num) in inputString.enumerated(){
            let intAtPosition = Int(String(num)) ?? 0
            result += (intAtPosition * Int(pow(2, Double((inputString.count - 1) - i))))
        }
        
        convertedLabel.text = "Decimal Value: " + String(result)
        result = 0
        inputString = ""
        
    }
    
    

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

