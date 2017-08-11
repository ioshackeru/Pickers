//
//  SlotMachineViewController.swift
//  DelegationDemos
//
//  Created by Tomer Buzaglo on 10/08/2017.
//  Copyright © 2017 iTomerBu. All rights reserved.
//

import UIKit
import AVFoundation

class SlotMachineViewController: UIViewController {

    lazy var player : AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "slot", withExtension: "mp3") else {
            return nil
        }
        
        return try? AVAudioPlayer(contentsOf: url)
    }()
    
    
    func playSound(){
        player?.play()
    }

    lazy var fruit:[UIImage] = {
        let result = [#imageLiteral(resourceName: "icons8-banana"), #imageLiteral(resourceName: "icons8-7_c"), #imageLiteral(resourceName: "icons8-cherry"), #imageLiteral(resourceName: "icons8-raspberry"), #imageLiteral(resourceName: "icons8-plum"), #imageLiteral(resourceName: "icons8-slot_machine"), #imageLiteral(resourceName: "icons8-pear"), #imageLiteral(resourceName: "icons8-citrus"), #imageLiteral(resourceName: "icons8-leprechaun")]
        return result
    }()

    @IBOutlet var betLabel: UILabel!
    @IBOutlet var slotPicker: UIPickerView!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBAction func spin(_ sender: UIButton) {
        let r1 = Int.nextRandom(max: 100)
        let r2 = Int.nextRandom(max: 100)
        let r3 = Int.nextRandom(max: 100)
        
        slotPicker.selectRow(r1, inComponent: 0, animated: true)
        slotPicker.selectRow(r2, inComponent: 1, animated: true)
        slotPicker.selectRow(r3, inComponent: 2, animated: true)
        
        playSound()
    }
    
    @IBAction func betStepper(_ sender: UIStepper) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for i in 0...2{
            slotPicker.selectRow(50 + Int.nextRandom(max: 10), inComponent: i, animated: true)
        }
        slotPicker.isUserInteractionEnabled = false
    }
}


extension SlotMachineViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
}

extension SlotMachineViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let v = UIImageView(image: fruit[row % fruit.count])
        return v
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return #imageLiteral(resourceName: "icons8-citrus").size.height
    }
}



















