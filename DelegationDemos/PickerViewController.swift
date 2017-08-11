//
//  PickerViewController.swift
//  DelegationDemos
//
//  Created by Tomer Buzaglo on 10/08/2017.
//  Copyright © 2017 iTomerBu. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {
    @IBOutlet var userGuess: UITextField!

    @IBAction func spin(_ sender: UIButton) {
        let rand1 = Int.nextRandom(max: 3)
        let rand2 = Int.nextRandom(max: 3)
        let rand3 = Int.nextRandom(max: 3)
        
        picker.selectRow(rand1, inComponent: 0, animated: true)
        picker.selectRow(rand2, inComponent: 1, animated: true)
        picker.selectRow(rand3, inComponent: 2, animated: true)
        
        let userText = userGuess.text ?? ""
        let resultText = "\(rand1 + 1)\(rand2 + 1)\(rand3 + 1)"
        
        //Strings are value types:!
        if userText == resultText{
            print(userText, resultText, "Success...")
        }else{
            print(userText, resultText, "Meh...")
        }
    
        let success = userText == resultText
        
        userGuess.placeholder = success ? "Sucecss" : "Fudged up."
        if success{
            userGuess.text = nil
        }
    }
    

    
    
    
    
    
    @IBOutlet var picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self
        // Do any additional setup after loading the view.
        
    }

}

let shapes = ["🤠", "🤡", "😈", "😄", "😎", "😇", "👽", "😯", "😋", "😘"]

extension PickerViewController : UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //how many wheels:
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //How many rows in a component?
        return 3
    }
}

extension PickerViewController : UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return (row + 1).description //shapes[row] //(row + 1).description
    }
}


extension Int{
    //Type Methods:
    //Type methods are called on the name of the type.
    //These methods are not instance methods. but Type methods.
    //methods associated with type itself.
    
    //Usage example: let rand = Int.nextRandom(10)
    static func nextRandom(max:Int) -> Int{
        let rand = Int(arc4random_uniform(UInt32(max)))
        return rand
    }
}








