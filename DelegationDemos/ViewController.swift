//
//  ViewController.swift
//  DelegationDemos
//
//  Created by Tomer Buzaglo on 10/08/2017.
//  Copyright © 2017 iTomerBu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var image: UIImageView!

    @IBAction func pickImage(_ sender: UIButton) {
        //init a new UIImagePickerController
        let picker = UIImagePickerController()
        //set some properties:
        picker.sourceType = .photoLibrary
        
        
        //We wanna be the delegate of the picker:
        picker.delegate = self
        
        //need to conform to:
        //UIImagePickerControllerDelegate
        //UINavigationControllerDelegate
        
        //show the new ViewController instance:
        self.present(picker, animated: true, completion: nil)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


extension ViewController :  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //here we get the photo.
        image.image =
            info["UIImagePickerControllerOriginalImage"] as? UIImage
        
        //UIImagePickerControllerOriginalImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    /*
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //the user cancled (cancel button).
    }
    */
}























