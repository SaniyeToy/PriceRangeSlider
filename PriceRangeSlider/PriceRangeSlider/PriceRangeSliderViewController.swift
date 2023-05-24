//
//  ViewController.swift
//  PriceRangeSlider
//
//  Created by SaniyeTOY on 23.05.2023.
//

import UIKit

class PriceRangeSliderViewController: UIViewController {

    @IBOutlet weak var maxValueTextField: UITextField!
    @IBOutlet weak var minValueTextField: UITextField!
    @IBOutlet weak var rangeSlider: RangeSlider!
    let minValue: Double = 0
    let maxValue: Double = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        maxValueTextField.delegate = self
        minValueTextField.delegate = self
        maxValueTextField.text = "\(maxValue)"
        minValueTextField.text = "\(minValue)"
        rangeSlider.minimumValue = minValue
        rangeSlider.maximumValue = maxValue
        rangeSlider.lowerValue = 0.0
        rangeSlider.addTarget(self, action: #selector(sliderValueChange(_:)), for: .valueChanged)
    }
    
    @objc func sliderValueChange(_ sender: RangeSlider) {
        maxValueTextField.text = "\(Int(rangeSlider.lowerValue))"
        minValueTextField.text = "\(Int(rangeSlider.upperValue))"
    }
}

extension PriceRangeSliderViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        rangeSlider.lowerValue = Double(minValueTextField.text ?? "0.0") ?? 0.0
        rangeSlider.upperValue = Double(maxValueTextField.text ?? "0.0") ?? 0.0
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
