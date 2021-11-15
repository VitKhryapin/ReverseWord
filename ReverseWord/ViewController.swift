//
//  ViewController.swift
//  ReverseWord
//
//  Created by Vitaly Khryapin on 11.11.2021.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet weak var topBackground: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var inputTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var reverseButtonOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        inputTF.addTarget(self, action: #selector(editingBegan(_:)), for: .editingDidBegin)
//        inputTF.addTarget(self, action: #selector(editingEnded(_:)), for: .editingDidEnd)
        
        
        // button
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
        reverseButtonOutlet.bottomAnchor.constraint(equalTo: parentButton.bottomAnchor, constant: -66).isActive = true
        
        grayLine()
        
    }
    
    func grayLine () {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 358, height: 0)
        
        view.alpha = 0.2
        let stroke = UIView()
        stroke.bounds = view.bounds.insetBy(dx: -0.25, dy: -0.25)
        stroke.center = view.center
        view.addSubview(stroke)
        view.bounds = view.bounds.insetBy(dx: -0.25, dy: -0.25)
        stroke.layer.borderWidth = 0.5
        stroke.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        
        let parent = self.view!
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        view.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
        view.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0).isActive = true
    }
    
    func  blueLine () {
        let view = UILabel()
        view.frame = CGRect(x: 0, y: 0, width: 358, height: 0)
        
        let stroke = UIView()
        stroke.bounds = view.bounds.insetBy(dx: -0.5, dy: -0.5)
        stroke.center = view.center
        view.addSubview(stroke)
        view.bounds = view.bounds.insetBy(dx: -0.5, dy: -0.5)
        stroke.layer.borderWidth = 1
        stroke.layer.borderColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1).cgColor
        
        let parent = self.view!
        parent.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16).isActive = true
        view.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -16).isActive = true
        view.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0).isActive = true
    }
    
    func reversWords()  {
        if inputTF.text != "" {
            let string = String(inputTF.text!)
            var words = string.components(separatedBy: " ")
            stride(from: 0, to: words.count, by: 1)
                .forEach {words[$0] = String(words[$0].reversed())}
            let newString = words.joined(separator: " ")
            resultLabel.text = "\(newString)"
            inputTF.endEditing(false)
            
        }else{
            resultLabel.text = "Please type text"
        }
    }
    
    func clearFields () {
        if reverseButtonOutlet.currentTitle == "Clear" {
            inputTF.text = ""
            resultLabel.text = ""
        }
    }
    
    @IBAction func editingBegan(_ sender: UITextField) {
        reverseButtonOutlet.alpha = 1
        blueLine()
    }
    
    @IBAction func editingEnded(_ sender: UITextField) {
        
    }
    
    
    @IBAction func reverseButtonTap(_ sender: UIButton) {
        if reverseButtonOutlet.currentTitle == "Reverse" {
            reversWords()
        }else{
            clearFields()
        }
        if inputTF.text == "" {
            reverseButtonOutlet.setTitle("Reverse", for: .normal)
        }else{
            reverseButtonOutlet.setTitle("Clear", for: .normal)
        }
        grayLine()
    }
}

