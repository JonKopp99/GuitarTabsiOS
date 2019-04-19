//
//  CreateWebCustom.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 4/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit
import Firebase
class CreateWebCustom: UIViewController, UITextFieldDelegate{
    
    var artistName = String()
    var songName = String()
    var difficulty = String()
    var theDescription = String()
    
    var inputText = UITextField()
    var doneButton = UIButton()
    var label2 = UILabel()
    var customButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        let navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height * 0.1))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navView.isOpaque = true
        
        var theColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        if(difficulty == "Intermediate")
        {
            theColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        }else if(difficulty == "Expert")
        {
            theColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }else{
            theColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        }
        let song = NSMutableAttributedString(string: ("\"" + (songName) + "\""), attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-BoldItalic", size: 25)!, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        let splitter = NSMutableAttributedString(string: " - ", attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-Heavy", size: 23)!, NSAttributedString.Key.foregroundColor : theColor])
        let artist = NSMutableAttributedString(string: artistName, attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Book", size: 20)!, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        song.append(splitter)
        song.append(artist)
        
        let label = UILabel(frame: CGRect(x:0, y: navView.bounds.height/2-10, width: navView.bounds.width, height: 50))
        label.attributedText = song
        label.font = UIFont(name: "AvenirNextCondensed-HeavyItalic", size: 30.0)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        label2 = UILabel(frame: CGRect(x:10, y: navView.bounds.height + 10, width: navView.bounds.width-20, height: 65))
        label2.text = "Enter a song link\nor\ncreate your own custom song!"
        label2.numberOfLines = 3
        label2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label2.font = UIFont(name: "Avenir-Book", size: 20.0)
        label2.textAlignment = .center
        label2.adjustsFontSizeToFitWidth = true
        self.view.addSubview(label2)
        
        let backbutton = UIButton(frame: CGRect(x: 10, y: label.frame.minY + 12.5, width: 25, height: 25))
        backbutton.setImage(#imageLiteral(resourceName: "back_arrow"), for: .normal)
        backbutton.addTarget(self, action:#selector(self.backPressed), for: .touchUpInside)
        navView.addSubview(backbutton)
        navView.addSubview(label)
        self.view.addSubview(navView)
        
        inputText.frame = CGRect(x: 10, y:  label2.frame.maxY + 10, width: self.view.bounds.width - 20, height: 40)
        inputText.textAlignment = .center
        inputText.textColor = .black
        inputText.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        inputText.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.4)
        inputText.layer.cornerRadius = 20
        inputText.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        inputText.layer.borderWidth = 1.5
        inputText.placeholder = "Enter song link:"
        inputText.returnKeyType = UIReturnKeyType.done
        inputText.delegate = self
        self.view.addSubview(inputText)
        
        doneButton = UIButton(frame: CGRect(x: self.view.bounds.width - 65, y: inputText.frame.minY, width: 60, height: 40))
       // doneButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.4)
        doneButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 20.0)
        doneButton.backgroundColor = .clear
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(#colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1), for: .normal)
        doneButton.titleLabel?.adjustsFontSizeToFitWidth = true
        doneButton.addTarget(self, action:#selector(self.donePressed), for: .touchUpInside)
        //doneButton.layer.cornerRadius = 20
        //doneButton.layer.borderWidth = 1.5
        //doneButton.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        doneButton.alpha = 0.0
        self.view.addSubview(doneButton)
        
        customButton = UIButton(frame: CGRect(x: self.view.bounds.width / 2 - 100, y: doneButton.frame.maxY + 20, width: 200, height: 40))
        customButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        customButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 20.0)
        
        customButton.setTitle("Custom Song", for: .normal)
        customButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        customButton.titleLabel?.adjustsFontSizeToFitWidth = true
        customButton.addTarget(self, action:#selector(self.customPressed), for: .touchUpInside)
        customButton.layer.cornerRadius = 20
        customButton.layer.borderWidth = 1.5
        customButton.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.view.addSubview(customButton)
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2, animations: {
            self.inputText.frame = CGRect(x: 10, y:  self.label2.frame.maxY + 10, width: self.view.bounds.width - 75, height: 40)
            
        }, completion: { (finished: Bool) in
            self.doneButton.alpha = 1.0
        })
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        UIView.animate(withDuration: 0.2, animations: {
            self.inputText.frame = CGRect(x: 10, y:  self.label2.frame.maxY + 10, width: self.view.bounds.width - 20, height: 40)
        }, completion: { (finished: Bool) in
            self.doneButton.alpha = 0.0
        })
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return true
        }
        return super.canPerformAction(action, withSender: sender)
    }
    @objc func backPressed()
    {
        self.dismiss(animated: false, completion: nil)
    }
    @objc func donePressed()
    {
        print("done Pressed")
        done()
        
    }
    func done()
    {
        if let text = inputText.text
        {
            if(text != "")
            {
                UIView.animate(withDuration: 0.3, animations: {
                    self.inputText.removeFromSuperview()
                    self.doneButton.removeFromSuperview()
                    self.label2.text = text
                    self.customButton.setTitle("Submit", for: .normal)
                    self.customButton.frame = CGRect(x: self.view.bounds.width / 2 - 100, y: self.label2.frame.maxY + 10, width: 200, height: 40)
                    })
                
            }
        }
    }
    @objc func customPressed()
    {
        print("Custom Pressed")
        if(customButton.titleLabel?.text == "Custom Song")
        {
            let controller = CreateSongVC()
            controller.artistName = artistName
            controller.songName = songName
            controller.difficulty = difficulty
            controller.theDescription = theDescription
            self.present(controller, animated: false, completion: nil)
        }
        else if (customButton.titleLabel?.text == "Go Back"){
            perform(#selector(backPressed))
            
        }else{
            submitPressed()
        }
    }
    func submitPressed()
    {
        label2.text = "Thank you!"
        customButton.setTitle("Go Back", for: .normal)
        if let text = inputText.text
        {
            let ref2 = Database.database().reference().childByAutoId().key! + songName

            let userDefaults = Foundation.UserDefaults.standard
            var value = userDefaults.stringArray(forKey: "SavedLinks") ?? [String]()
            if(value.count == 0)
            {
                userDefaults.set([ref2], forKey: "SavedLinks")
                saveSongLinkToPhone(name: ref2)
            }else{
                value.append(ref2)
                userDefaults.set(value, forKey: "SavedLinks")
                saveSongLinkToPhone(name: ref2)
            }
            let ref = Database.database().reference().child("Links").child(ref2)
            ref.child("theUid").setValue(ref2)
            ref.child("theSongName").setValue(songName)
            ref.child("theArtist").setValue(artistName)
            ref.child("theDifficulty").setValue(difficulty)
            ref.child("theDescription").setValue(theDescription)
            ref.child("theLink").setValue(text)
        }
    }
    
    func saveSongLinkToPhone(name: String)
    {
        let userDefaults = Foundation.UserDefaults.standard
        var arr = [String]()
        arr.append(songName)
        arr.append(artistName)
        arr.append(difficulty)
        arr.append(inputText.text!)
        arr.append(theDescription)
        userDefaults.set(arr, forKey: name)
    }
}
