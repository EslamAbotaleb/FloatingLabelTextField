//
//  ViewController.swift
//  FloatLabelExample
//
//  Created by Fahim Farook on 28/11/14.
//  Copyright (c) 2014 RookSoft Ltd. All rights reserved.
//

import UIKit


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

class ViewController: UITableViewController {
	@IBOutlet var vwName:FloatLabelTextField!
	@IBOutlet var vwAddress:FloatLabelTextView!
	@IBOutlet var vwHolder:UIView!
    var textEmpty: Bool = false
    var placeText = "Label"

    @IBOutlet weak var errorMsgLbl: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        vwName.layer.cornerRadius = 10.0
        vwName.layer.borderWidth = 0.5
        vwName.layer.borderColor = UIColor.gray.cgColor
        

        
    }
    override func viewDidLoad() {
		super.viewDidLoad()
        vwName.delegate = self                  //set delegate to textfile
        vwName.clearButtonMode = .never
        vwName.placeholder = " Full name"
        
        if let myImage = UIImage(named: "right"){
            vwName.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.text)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != "" {
            vwName.layer.borderWidth = 0.5
            vwName.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text)
          return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let updatedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string)
        
        if updatedString != "" {
            self.errorMsgLbl.isHidden = true
            vwName.setLeftPaddingPoints(16)
            self.vwName.textColor = .black
            self.vwName.layer.borderWidth = 1.0
            self.vwName.backgroundColor = .white
            self.vwName.layer.borderColor = UIColor.black.cgColor
        } else {
            self.errorMsgLbl.isHidden = false
            self.errorMsgLbl.text = "Error Message"
            self.errorMsgLbl.textColor = .red
            self.vwName.backgroundColor = .red
        }
        return true
    }
}
extension UITextField {

enum Direction {
    case Left
    case Right
}

// add image to textfield
func withImage(direction: Direction, image: UIImage, colorSeparator: UIColor, colorBorder: UIColor){
    let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    mainView.layer.cornerRadius = 5

    let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
    view.backgroundColor = .white
    view.clipsToBounds = true
    view.layer.cornerRadius = 5
    view.layer.borderWidth = CGFloat(0.0)
    view.layer.borderColor = colorBorder.cgColor
    mainView.addSubview(view)

    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
    view.addSubview(imageView)

    let seperatorView = UIView()
    seperatorView.backgroundColor = colorSeparator
    mainView.addSubview(seperatorView)

    if(Direction.Left == direction){ // image left
        seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
        self.leftViewMode = .always
        self.leftView = mainView
    } else { // image right
        seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
        self.rightViewMode = .always
        self.rightView = mainView
    }

    self.layer.borderColor = colorBorder.cgColor
    self.layer.borderWidth = CGFloat(0.0)
    self.layer.cornerRadius = 5
}

}
