//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Deshpande, Anup on 5/22/19.
//  Copyright © 2019 Deshpande, Anup. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var billValueTextField: UITextField!
    @IBOutlet weak var tipChoiceSelector: UISegmentedControl!
    @IBOutlet weak var customTipSlider: UISlider!
    @IBOutlet weak var calculatedTipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var ImageBackground: UIImageView!
    
    var tipPercentage = 10.0{
        didSet{
            tipPercentageLabel.text = "\(Int(tipPercentage))%"

            calculateTotal()
        }
    }
    var billAmount = 0.0
    var tip = 0.00
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billValueTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func clearAllClicked(_ sender: UIButton) {
        billValueTextField.text = ""
        tipPercentageLabel.text = "10%"
        totalLabel.text = "0.00"
        calculatedTipLabel.text = "0.00"
    
    }
    
    
    @IBAction func textEdited(_ sender: UITextField) {
      billAmount = Double(sender.text!) ?? 0.00
      calculateTotal()
    }
    
    
    @IBAction func percentageChangeButtonClicked(_ sender: UIButton) {
        switch sender.title(for: UIControl.State.normal) {
        case "➕":
            if tipPercentage != 50{
                tipPercentage += 1
            }
        case "➖":
            if tipPercentage != 1{
            tipPercentage -= 1
            }
        case "10":
            tipPercentage = 10
        case "15":
            tipPercentage = 15
        case "18":
            tipPercentage = 18
        case "20":
            tipPercentage = 20
            break
        default:
            print("default code")
        }
    }
    
    
    func calculateTotal(){
        tip = Double(billAmount * (tipPercentage/100))
        calculatedTipLabel.text = "$\(String(format: "%.2f", tip))"
        totalLabel.text = "$\(String(format: "%.2f", tip + billAmount))"
    }
    
}

