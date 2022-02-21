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
    @IBOutlet weak var textIgnoreTF: UITextField!
    @IBOutlet weak var segmentControllerOutlet: UISegmentedControl!
    @IBOutlet weak var AllCharactersExceptionLabel: UILabel!
    let bottomLine = CALayer()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        inputTF.delegate = self
        textIgnoreTF.delegate = self
        inputTF.accessibilityIdentifier = "inputTF"
        resultLabel.accessibilityIdentifier = "resultLabel"
        textIgnoreTF.accessibilityIdentifier = "textIgnoreTF"
        
        //bottom line text field options
        bottomLine.frame = CGRect(x: 0.0, y: inputTF.frame.height - 1, width: inputTF.frame.width, height: 1.0)
        inputTF.bounds = inputTF.bounds.insetBy(dx: 0, dy: -5.25)
        bottomLine.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        inputTF.layer.addSublayer(bottomLine)
        bottomLine.accessibilityLabel = "bottomLine"
        
        // button options
        reverseButtonOutlet.frame = CGRect(x: 0, y: 0, width: 343, height: 56)
        reverseButtonOutlet.alpha = 0.6
        reverseButtonOutlet.layer.backgroundColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        reverseButtonOutlet.layer.cornerRadius = 14
        let paragraphStyle = NSMutableParagraphStyle()
        reverseButtonOutlet.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        paragraphStyle.lineHeightMultiple = 1.08
        buttonConstraints()
    }
    
    func buttonConstraints () {
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
        if segmentControllerOutlet.selectedSegmentIndex == 0 {
            selectedSegmentDefault()
        } else {
            selectedSegmentCustom()
        }
    }
    //inputTF.endEditing(false) // if button not Hidden
    
    func selectedSegmentDefault() {
        if let string: String = inputTF.text {
            let words = string.components(separatedBy: " ")
            let character = string.compactMap{$0}
            let reverseString = words.map{String($0.reversed())}
            var numberOfExceptionalValues = 0
            var resultString: String = ""
            let reverseCharacter = reverseString
                .joined(separator: " ")
                .filter{$0.isLetter}
                .compactMap{$0}
            for indexCharacter in character.indices {
                if !character[indexCharacter].isLetter {
                    resultString = resultString + String(character[indexCharacter])
                    numberOfExceptionalValues += 1
                } else {
                    resultString = resultString + String(reverseCharacter[indexCharacter-numberOfExceptionalValues])
                }
                resultLabel.text = "\(resultString)"
            }
        }
    }
    
    func selectedSegmentCustom() {
        if let string: String = inputTF.text {
            let words = string.components(separatedBy: " ")
            let character = string.compactMap{$0}
            let reverseString = words.map{String($0.reversed())}
            var numberOfExceptionalValues = 0
            var resultString: String = ""
            let exceptional: String = textIgnoreTF.text!
            let characterExceptional = Array(exceptional)
            let reverseCharacter = reverseString
                .joined(separator: " ")
                .filter{!characterExceptional.contains($0)}
                .compactMap{$0}
            for indexCharacter in character.indices {
                if  characterExceptional.contains(character[indexCharacter]) {
                    resultString += String(character[indexCharacter])
                    numberOfExceptionalValues += 1
                } else {
                    resultString += String(reverseCharacter[indexCharacter - numberOfExceptionalValues])
                }
                resultLabel.text = "\(resultString)"
            }
        }
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
    
    @IBAction func segmentControllerChanged(_ sender:  UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            textIgnoreTF.isHidden = true
            AllCharactersExceptionLabel.isHidden = false
            textIgnoreTF.borderStyle = .none
            textIgnoreTF.textAlignment = .center
            reversWords()
        case 1:
            textIgnoreTF.isHidden = false
            AllCharactersExceptionLabel.isHidden = true
            textIgnoreTF.borderStyle = .roundedRect
            textIgnoreTF.textAlignment = .left
            reversWords()
        default:
            break
        }
    }
    
    @IBAction func checkTF(_ sender: UITextField) {
        reversWords()
    }
    
    @IBAction func checkExceptionalTF(_ sender: UITextField) {
        reversWords()
    }
    
    //Hidden
    @IBAction func reverseButtonTap(_ sender: UIButton) {
        if  inputTF.text == "" || inputTF.text == nil   {
            
            resultLabel.text = "Please type text"
        } else if inputTF.text != "" && resultLabel.text != "" && resultLabel.text != "Please type text" {
            clearFields()
        } else {
            reversWords()
        }
        
        if inputTF.text == "" {
            reverseButtonOutlet.setTitle("Reverse", for: .normal)
        } else {
            reverseButtonOutlet.setTitle("Clear", for: .normal)
        }
    }
}

