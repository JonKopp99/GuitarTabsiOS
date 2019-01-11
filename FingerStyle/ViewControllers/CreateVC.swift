//
//  CreateVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit

class CreateVC: UIViewController, UITextFieldDelegate {
    var ArtistTextField = UITextField()
    var SongTextField = UITextField()
    var difficulty = String()
    var errorMSG = UILabel()

    var begButton = UIButton()
    var intButton = UIButton()
    var expButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        print("Create VC")
        let navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 80))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navView.isOpaque = true
        
        let label = UILabel(frame: CGRect(x:0, y: navView.bounds.height/2-10, width: navView.bounds.width, height: 50))
        label.text = "Create Tab"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "AvenirNextCondensed-HeavyItalic", size: 35.0)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        let backbutton = UIButton(frame: CGRect(x: 10, y: label.frame.minY + 12.5, width: 25, height: 25))
        backbutton.setImage(#imageLiteral(resourceName: "back_arrow"), for: .normal)
        backbutton.addTarget(self, action:#selector(self.backPressed), for: .touchUpInside)
        navView.addSubview(backbutton)
        navView.addSubview(label)
        self.view.addSubview(navView)
        
        SongTextField.frame = CGRect(x: 50, y: navView.frame.maxY + 80, width: view.bounds.width - 100, height: 80)
        SongTextField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        SongTextField.isEnabled = true
        SongTextField.placeholder = "Song name."
        SongTextField.font = UIFont(name: "AvenirNext-Medium", size: 25)
        SongTextField.autocorrectionType = UITextAutocorrectionType.yes
        SongTextField.keyboardType = UIKeyboardType.default
        SongTextField.returnKeyType = UIReturnKeyType.done
        SongTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
        SongTextField.contentVerticalAlignment = .center
        SongTextField.delegate = self
        SongTextField.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        SongTextField.layer.cornerRadius = 20
        SongTextField.layer.borderWidth = 2
        SongTextField.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        SongTextField.textAlignment = .center
        SongTextField.adjustsFontSizeToFitWidth = true
        self.view.addSubview(SongTextField)
        
        
        ArtistTextField.frame = CGRect(x: 50, y: SongTextField.frame.maxY + 30, width: view.bounds.width - 100, height: 80)
        ArtistTextField.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ArtistTextField.isEnabled = true
        ArtistTextField.placeholder = "Artist name."
        ArtistTextField.font = UIFont(name: "AvenirNext-Medium", size: 25)
        ArtistTextField.autocorrectionType = UITextAutocorrectionType.yes
        ArtistTextField.keyboardType = UIKeyboardType.default
        ArtistTextField.returnKeyType = UIReturnKeyType.done
        ArtistTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
        ArtistTextField.contentVerticalAlignment = .center
        ArtistTextField.delegate = self
        ArtistTextField.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        ArtistTextField.layer.cornerRadius = 20
        ArtistTextField.layer.borderWidth = 2
        ArtistTextField.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        ArtistTextField.textAlignment = .center
        ArtistTextField.adjustsFontSizeToFitWidth = true
        self.view.addSubview(ArtistTextField)
        
        begButton = UIButton(frame: CGRect(x: 10, y: ArtistTextField.frame.maxY + 30, width: view.bounds.width * 0.3, height: 50))
        begButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        begButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 20.0)
        begButton.titleLabel?.adjustsFontSizeToFitWidth = true
        begButton.setTitle("Beginner", for: .normal)
        begButton.setTitleColor(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), for: .normal)
        begButton.addTarget(self, action:#selector(self.begPressed), for: .touchUpInside)
        begButton.layer.cornerRadius = 20
        begButton.layer.borderWidth = 2
        begButton.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.view.addSubview(begButton)
        
        intButton = UIButton(frame: CGRect(x: begButton.frame.maxX + 10, y: ArtistTextField.frame.maxY + 30, width: view.bounds.width * 0.3, height: 50))
        intButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        intButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 20.0)
        intButton.titleLabel?.adjustsFontSizeToFitWidth = true
        intButton.setTitle("Intermediate", for: .normal)
        intButton.setTitleColor(#colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), for: .normal)
        intButton.addTarget(self, action:#selector(self.intPressed), for: .touchUpInside)
        intButton.layer.cornerRadius = 20
        intButton.layer.borderWidth = 2
        intButton.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.view.addSubview(intButton)
        
        expButton = UIButton(frame: CGRect(x: intButton.frame.maxX + 10, y: ArtistTextField.frame.maxY + 30, width: view.bounds.width * 0.3, height: 50))
        expButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        expButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 20.0)
        expButton.titleLabel?.adjustsFontSizeToFitWidth = true
        expButton.setTitle("Expert", for: .normal)
        expButton.setTitleColor(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), for: .normal)
        expButton.addTarget(self, action:#selector(self.expPressed), for: .touchUpInside)
        expButton.layer.cornerRadius = 20
        expButton.layer.borderWidth = 2
        expButton.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.view.addSubview(expButton)
        
        
        
        let doneButton = UIButton(frame: CGRect(x: 100, y: self.view.bounds.height - 70, width: view.bounds.width - 200, height: 50))
        doneButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        doneButton.titleLabel?.font = UIFont(name: "AvenirNext-Heavy", size: 20.0)
        doneButton.titleLabel?.adjustsFontSizeToFitWidth = true
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        doneButton.addTarget(self, action:#selector(self.donePressed), for: .touchUpInside)
        doneButton.layer.cornerRadius = 20
        doneButton.layer.borderWidth = 2
        doneButton.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.view.addSubview(doneButton)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        let theTabBar = TabBarVC()
//        TabBarVC.currentSelected = "Add"
//        theTabBar.loadViewIfNeeded()
//        self.view.addSubview(theTabBar.view)
//        self.addChild(theTabBar)
        
    }
    
    @objc func backPressed()
    {
            let controller = SavedVC()
            self.present(controller, animated: false, completion: nil)
    }
    @objc func begPressed()
    {
        difficulty = "Beginner"
        begButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        expButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        intButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    @objc func intPressed()
    {
        difficulty = "Intermediate"
        begButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        expButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        intButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }
    @objc func expPressed()
    {
        difficulty = "Expert"
        begButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        intButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        expButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }
    
    @objc func donePressed()
    {
        errorMSG.removeFromSuperview()
        if(SongTextField.text == "")
        {
            print("Song must have a name.")
            errorMSG.text = "Song must have a name."
        }
        else if(ArtistTextField.text == "")
        {
            print("Song must have an artist")
            errorMSG.text = "Song must have an artist."
        }
        else if(difficulty == "")
        {
            print("Must have a difficulty selected!")
            errorMSG.text = "Select difficulty."
        }else{
            let controller = CreateSongVC()
            controller.artistName = ArtistTextField.text!
            controller.songName = SongTextField.text!
            controller.difficulty = difficulty
            self.present(controller, animated: false, completion: nil)
        }
        errorMSG.frame = CGRect(x: 10, y: intButton.frame.maxY + 30, width: self.view.bounds.width - 20, height: 30)
        errorMSG.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        errorMSG.font = UIFont(name: "AvenirNext-Bold", size: 15)
        errorMSG.textAlignment = .center
        //errorMSG.sizeToFit()
        errorMSG.adjustsFontSizeToFitWidth = true
        self.view.addSubview(errorMSG)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        super.touchesBegan(touches,  with: event)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
