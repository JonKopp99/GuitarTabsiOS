//
//  SettingsVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    var buttonView = UIView()
    var navView = UIView()
    var theTabBar = TabBarVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        TabBarVC.currentSelected = "Settings"
        self.view.backgroundColor = .white
        navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height * 0.1))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navView.isOpaque = true
        
        let label = UILabel(frame: CGRect(x:0, y: navView.bounds.height/2-10, width: navView.bounds.width, height: 50))
        label.text = "Help"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "AvenirNextCondensed-HeavyItalic", size: 30.0)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        navView.addSubview(label)
        self.view.addSubview(navView)
        buttonView.backgroundColor = .clear
        buttonView.frame = CGRect(x: self.view.bounds.width/2 - 100, y: self.view.bounds.height/2 - 105, width: 200, height: 165)
        
       let aboutButton = UIButton()
        aboutButton.frame = CGRect(x: 10, y: 0, width: 180, height: 50)
        aboutButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        aboutButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        aboutButton.titleLabel?.adjustsFontSizeToFitWidth = true
        aboutButton.setTitle("About", for: .normal)
        aboutButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        aboutButton.addTarget(self, action:#selector(self.aboutPressed), for: .touchUpInside)
        aboutButton.layer.cornerRadius = 25
        aboutButton.layer.borderWidth = 1.5
        aboutButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.buttonView.addSubview(aboutButton)
        
        let contactButton = UIButton()
        contactButton.frame = CGRect(x: 10, y: aboutButton.frame.maxY + 5, width: 180, height: 50)
        contactButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        contactButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        contactButton.titleLabel?.adjustsFontSizeToFitWidth = true
        contactButton.setTitle("Contact", for: .normal)
        contactButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        contactButton.addTarget(self, action:#selector(self.contactPressed), for: .touchUpInside)
        contactButton.layer.cornerRadius = 25
        contactButton.layer.borderWidth = 1.5
        contactButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.buttonView.addSubview(contactButton)
        
        let howButton = UIButton()
        howButton.frame = CGRect(x: 10, y: contactButton.frame.maxY + 5, width: 180, height: 50)
        howButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        howButton.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 20.0)
        howButton.titleLabel?.adjustsFontSizeToFitWidth = true
        howButton.setTitle("How to use", for: .normal)
        howButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        howButton.addTarget(self, action:#selector(self.howtoPressed), for: .touchUpInside)
        howButton.layer.cornerRadius = 25
        howButton.layer.borderWidth = 1.5
        howButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.buttonView.addSubview(howButton)
        self.theTabBar.view.addSubview(buttonView)
    }
    override func viewDidAppear(_ animated: Bool) {
        TabBarVC.currentSelected = "Settings"
        //theTabBar.loadViewIfNeeded()
        self.view.addSubview(theTabBar.view)
        self.addChild(theTabBar)
        
    }
    
    @objc func aboutPressed()
    {

        let controller = aboutUsVC()
        self.present(controller, animated: false, completion: nil)
    }
    @objc func contactPressed()
    {
        let controller = ContactVC()
        self.present(controller, animated: false, completion: nil)
    }
    @objc func howtoPressed()
    {

        let controller = HowToVC()
        self.present(controller, animated: false, completion: nil)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
            
        }
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
