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
    @IBOutlet weak var customTipPercentageLabel: UILabel!
    
    @IBOutlet weak var ImageBackground: UIImageView!
    
    var tipPercentage = 10.0
    var billAmount = 0.0
    var tip = 0.00
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billValueTextField.delegate = self
        customTipSlider.isEnabled = false

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func clearAllClicked(_ sender: UIButton) {
        billValueTextField.text = ""
        tipChoiceSelector.selectedSegmentIndex = 0
        customTipPercentageLabel.text = "25 %"
        totalLabel.text = "0.00"
        calculatedTipLabel.text = "0.00"
        customTipSlider.isEnabled = false
    }
    
    @IBAction func textEdited(_ sender: UITextField) {
      print("Text Edited")
      billAmount = Double(sender.text!) ?? 0.00
      calculateTotal()
    }
    
    
    @IBAction func segmentChoiceChanged(_ sender: UISegmentedControl) {
        
        if billValueTextField.text != ""{
            billAmount = Double(billValueTextField.text!) ?? 0.00
        }
        
        if sender.selectedSegmentIndex == 3 {
            customTipSlider.isEnabled = true
            tipPercentage = Double(customTipSlider.value.rounded())
            calculateTotal()
            
        }else{
            customTipSlider.isEnabled = false
            
            if sender.selectedSegmentIndex == 0{
                tipPercentage = 10
            }else if sender.selectedSegmentIndex == 1{
                tipPercentage = 15
            }else if sender.selectedSegmentIndex == 2{
                tipPercentage = 18
            }
            
            calculateTotal()
        }
   
    }
    
    func calculateTotal(){
        tip = Double(billAmount * (tipPercentage/100))
        calculatedTipLabel.text = "$\(tip)"
        totalLabel.text = "$\(tip + billAmount)"
    }
    
    @IBAction func sliderPositionChanged(_ sender: UISlider) {
        print("\(sender.value.rounded())")
        customTipPercentageLabel.text = "\(Int(sender.value.rounded()))% "
        tipPercentage = Double(sender.value.rounded())
        calculateTotal()
    }
}

