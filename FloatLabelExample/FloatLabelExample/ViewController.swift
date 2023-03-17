//
//  ViewController.swift
//  FloatLabelExample
//
//  Created by Fahim Farook on 28/11/14.
//  Copyright (c) 2014 RookSoft Ltd. All rights reserved.
//

import UIKit



class ViewController: UITableViewController {
	@IBOutlet var vwName:FloatLabelTextField!
	@IBOutlet var vwAddress:FloatLabelTextView!
	@IBOutlet var vwHolder:UIView!
    var textEmpty: Bool = false
    var placeText = "Label"

    override func viewDidLoad() {
		super.viewDidLoad()
        vwName.delegate = self                  //set delegate to textfile

        vwName.clearButtonMode = .never
        vwName.placeholder = " Full name"

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
    
}

extension ViewController: UITextFieldDelegate {
    /*
     func textFieldDidBeginEditing(textField: UITextField!) {    //delegate method

     }

     func textFieldShouldEndEditing(textField: UITextField!) -> Bool {  //delegate method
         return false
     }

     func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
       textField.resignFirstResponder()

         return true
     }
     */
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.text)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text)

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text)


          return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
     
//        if let updatedString {
//            let imageName = "close.png"
//            let image = UIImage(named: imageName)
//            let imageView = UIImageView(image: image!)
//            if updatedString.isEmpty {
//                imageView.frame = CGRect(x: 0, y: 0
//                                         , width: 0, height: 0)
//            } else {
//                imageView.frame = CGRect(x: placeText.count * 8, y: 2
//                                         , width: 15, height: 15)
//            }
//            vwName.addSubview(imageView)
//        }

        return true
    }
}
