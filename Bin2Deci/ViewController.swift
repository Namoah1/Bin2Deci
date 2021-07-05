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
    @IBOutlet weak var binDecToggleSegmentedControl: UISegmentedControl!
    
    var result = 0
    var resultStr = ""
    let allowedInputBin = CharacterSet(charactersIn:"01").inverted
    let allowedInputDec = CharacterSet(charactersIn:"012345678").inverted
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
        
    }
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
        if binDecToggleSegmentedControl.selectedSegmentIndex == 0 {
            var filteredBool = false
            let currentText = textField.text ?? ""
            let components = string.components(separatedBy: allowedInputBin)
            let filtered = components.joined(separator: "")
            let newString = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            if string == filtered{
                filteredBool = true
            }else{
                filteredBool = false
            }

            return filteredBool && newString.count <= 8
        }else{
            var filteredBool = false
            let currentText = textField.text ?? ""
            let components = string.components(separatedBy: allowedInputDec)
            let filtered = components.joined(separator: "")
            let newString = (currentText as NSString).replacingCharacters(in: range, with: string)
            
            if string == filtered{
                filteredBool = true
            }else{
                filteredBool = false
            }

            return filteredBool && newString.count <= 10
        }
            

    }
    
    
    
    @IBAction func convertButton(_ sender: Any) {
        
        if binDecToggleSegmentedControl.selectedSegmentIndex == 0 {
            var inputString = inputTextField.text ?? ""
            for (i, num) in inputString.enumerated(){
                let intAtPosition = Int(String(num)) ?? 0
                result += (intAtPosition * Int(pow(2, Double((inputString.count - 1) - i))))
            }
            
            convertedLabel.text = "Decimal Value: " + String(result)
            result = 0
            inputString = ""
        }else{
            var inputString = inputTextField.text ?? ""
            var decNum = Int(inputString) ?? 0
            while decNum > 0 {
                resultStr += String(decNum % 2)
                decNum = decNum / 2
            }
            
            resultStr = String(resultStr.reversed())
            convertedLabel.text = "Binary Value: " + resultStr
            resultStr = ""
            inputString = ""
            }
            
        }
        

        
    
    
    @IBAction func binDecSegmentedControl(_ sender: Any) {
        if binDecToggleSegmentedControl.selectedSegmentIndex == 1{
            convertedLabel.text = "Binary: 0"
            inputTextField.placeholder = "Enter Decimal Digits Here"
            inputTextField.text = ""
        }else{
            convertedLabel.text = "Decimal: 0"
            inputTextField.placeholder = "Enter Binary Digits Here"
            inputTextField.text = ""
        }
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

