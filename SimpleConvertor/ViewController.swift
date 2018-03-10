//
//  ViewController.swift
//  SimpleConvertor
//
//  Created by Joon on 2018/03/04.
//  Copyright © 2018 penubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var targetTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    @IBOutlet weak var targetScale: UITextField!
    @IBOutlet weak var resultScale: UITextField!
    
    var model = ConvertorModel()
    var scales = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @IBAction func touchConvert(_ sender: UIButton) {
        guard let targetValueString = targetTextField.text,
              let targetValue = Double(targetValueString) else {
            return // unvalid text
        }

        let target = targetScale.text!
        let result = resultScale.text!
        if let resultValue = model.convert(targetValue, from: target, to: result) {
            resultTextField.text = String(resultValue)
        } else {
            resultTextField.text = "unValid"
        }
    }
    
    func createScalePicker() {
        let targetScalePicker = UIPickerView()
        let resultScalePicker = UIPickerView()
        let pickers = [targetScalePicker, resultScalePicker]
        
        // Customize
        for picker in pickers {
            picker.delegate = self
            picker.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        }
        
        targetScale.inputView = targetScalePicker
        resultScale.inputView = resultScalePicker
    }
    
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()  // if you don't do that you can not see toolBar
        
        // Customize
        toolBar.barTintColor = .black
        toolBar.tintColor = .white
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dissmissKeyBoard))
        // TODO: add cancel items what is action of cancel?
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        targetScale.inputAccessoryView = toolBar
        resultScale.inputAccessoryView = toolBar
    }
    
    @objc func dissmissKeyBoard() {
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTextField.isUserInteractionEnabled = false // user can't interact with this
        createScalePicker()
        createToolBar()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return scales.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let scale: String = scales[row]
        // TODO: why I can't use switch here
        if pickerView == targetScale.inputView {
            targetScale.text = scale
        } else if pickerView == resultScale.inputView {
            resultScale.text = scale
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        //TODO: Customize font in pickerView with label
    
        var label: UILabel
        
        if let pickerView = view as? UILabel {
            label = pickerView
        } else {
            label = UILabel()
        }
        
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Source-Code-Pro", size: 30)
        label.text = scales[row]
        
        return label
    }
}







