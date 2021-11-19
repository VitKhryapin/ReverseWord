//
//  ViewController.swift
//  ReverseWord
//
//  Created by Vitaly Khryapin on 11.11.2021.
//

import UIKit



class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var topBackground: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseButtonOutlet: UIButton!
    
    let bottomLine = CALayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTF.delegate = self
        // Do any additional setup after loading the view.
        
        //bottom line text field options
        bottomLine.frame = CGRect(x: 0.0, y: inputTF.frame.height - 1, width: inputTF.frame.width, height: 1.0)
        inputTF.bounds = inputTF.bounds.insetBy(dx: 0, dy: -11.25)
        bottomLine.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        inputTF.layer.addSublayer(bottomLine)
        
        // button options
        reverseButtonOutlet.frame = CGRect(x: 0, y: 0, width: 343, height: 56)
        reverseButtonOutlet.alpha = 0.6
        reverseButtonOutlet.layer.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        reverseButtonOutlet.layer.cornerRadius = 14
        let paragraphStyle = NSMutableParagraphStyle()
        reverseButtonOutlet.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        paragraphStyle.lineHeightMultiple = 1.08
        let parentButton = self.view!
        parentButton.addSubview(reverseButtonOutlet)
        reverseButtonOutlet.translatesAutoresizingMaskIntoConstraints = false
        reverseButtonOutlet.heightAnchor.constraint(equalToConstant: 56).isActive = true
        reverseButtonOutlet.leadingAnchor.constraint(equalTo: parentButton.leadingAnchor, constant: 16).isActive = true
        reverseButtonOutlet.trailingAnchor.constraint(equalTo: parentButton.trailingAnchor, constant: -16).isActive = true
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func reversWords()  {
        if let string: String = inputTF.text {
            let words = string.components(separatedBy: " ")
            let newString = words.map{str in String(str.reversed())}
            resultLabel.text = "\(newString.joined(separator: " "))"
        }
        inputTF.endEditing(false)
    }
    
    func clearFields() {
            inputTF.text = ""
            resultLabel.text = ""
    }
    
    @IBAction func editingBegan(_ sender: UITextField) {
        reverseButtonOutlet.alpha = 1
        bottomLine.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
    }
    
    @IBAction func editingEnded(_ sender: UITextField) {
        bottomLine.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
    }
    
    @IBAction func reverseButtonTap(_ sender: UIButton) {
        if  inputTF.text == "" || inputTF.text == nil   {
            
            resultLabel.text = "Please type text"
        }else if inputTF.text != "" && resultLabel.text != "" && resultLabel.text != "Please type text" {
            clearFields()
        }else{
            reversWords()
        }
        
        if inputTF.text == "" {
            reverseButtonOutlet.setTitle("Reverse", for: .normal)
        }else{
            reverseButtonOutlet.setTitle("Clear", for: .normal)
        }
    }
}

