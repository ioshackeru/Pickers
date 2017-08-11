//
//  GenderViewController.swift
//  DelegationDemos
//
//  Created by Tomer Buzaglo on 10/08/2017.
//  Copyright © 2017 iTomerBu. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController {
    let genders = ["Male😘", "Female","Trans", "Other"]
    
    @IBOutlet var genderPicker: UIPickerView!
    @IBOutlet var genderLabel: UILabel!
}
extension GenderViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderLabel.text = genders[row]
        genderLabel.isHidden = false
    }
}
extension GenderViewController : UIPickerViewDataSource{

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
}













