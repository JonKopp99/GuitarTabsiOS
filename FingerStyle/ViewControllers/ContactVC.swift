//
//  ContactVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/13/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class ContactVC: UIViewController, UITextViewDelegate {
    
    var navView = UIView()
    var desctextView = UITextView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height * 0.1))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navView.isOpaque = true
        
        let label = UILabel(frame: CGRect(x:0, y: navView.bounds.height/2-10, width: navView.bounds.width, height: 50))
        label.text = "Contact"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "AvenirNextCondensed-HeavyItalic", size: 30.0)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        navView.addSubview(label)
        
        let backbutton = UIButton(frame: CGRect(x: 10, y: label.frame.minY + 12.5, width: 25, height: 25))
        backbutton.setImage(#imageLiteral(resourceName: "back_arrow"), for: .normal)
        backbutton.addTarget(self, action:#selector(self.backPressed), for: .touchUpInside)
        navView.addSubview(backbutton)
        self.view.addSubview(navView)
        
        
        
        
        
        desctextView.frame = CGRect(x: 10, y: navView.frame.maxY + 10, width: self.view.bounds.width - 20, height: 180)
        desctextView.delegate = self
        desctextView.textAlignment = .left
        desctextView.textColor = UIColor.black
        desctextView.text = "Contact me in regards to anything app related. I want this app to be perfect for every user. If you find any bugs or want any new features, press the contact button below!"
        desctextView.font = UIFont(name: "Avenir-Roman", size: 20)
        desctextView.isSelectable = true
        desctextView.layer.cornerRadius = 10
        desctextView.autocorrectionType = .yes
        desctextView.spellCheckingType = UITextSpellCheckingType.yes
        desctextView.isEditable = false
        desctextView.keyboardType = UIKeyboardType.default
        desctextView.returnKeyType = .done
        desctextView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1).withAlphaComponent(0.1)
        desctextView.sizeToFit()
        self.view.addSubview(desctextView)
        
        
        let contactButton = UIButton()
        contactButton.frame = CGRect(x: self.view.bounds.width/2 - 90, y: desctextView.frame.maxY + 5, width: 180, height: 50)
        contactButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        contactButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        contactButton.titleLabel?.adjustsFontSizeToFitWidth = true
        contactButton.setTitle("Contact", for: .normal)
        contactButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        contactButton.addTarget(self, action:#selector(self.contactPressed), for: .touchUpInside)
        contactButton.layer.cornerRadius = 25
        contactButton.layer.borderWidth = 1.5
        contactButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(contactButton)
    }
    @objc func contactPressed()
    {
        let url = NSURL(string: "mailto:jonathan.kopp@students.makeschool.com")

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        }
        
//        var ctr = 0
//        while(ctr < 10)
//        {
//            let ref2 = Database.database().reference().childByAutoId().key! + "\(ctr)"
//            let ref = Database.database().reference().child("Links").child(ref2)
//            ref.child("theUid").setValue(ref2)
//            ref.child("theSongName").setValue("")
//            ref.child("theArtist").setValue("")
//            ref.child("theDifficulty").setValue("")
//            ref.child("theDescription").setValue("")
//            ref.child("theLink").setValue("")
//            ref.child("theType").setValue("")
//            ctr += 1
//        }  
    }
    @objc func backPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
            
        }
    }
}
