//
//  aboutUsVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/13/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//


import UIKit

class aboutUsVC: UIViewController, UITextViewDelegate {
    
    var buttonView = UIView()
    var navView = UIView()
    var selfie = UIButton()
    var ctr = 0.0
    var timer = Timer()
    var timerActive = Bool()
    var direction = 0
    var desctextView = UITextView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height * 0.1))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navView.isOpaque = true
        
        let label = UILabel(frame: CGRect(x:0, y: navView.bounds.height/2-10, width: navView.bounds.width, height: 50))
        label.text = "About"
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
        
        
        
        selfie.frame = CGRect(x: self.view.bounds.width/2 - 75, y: self.navView.frame.maxY + 10, width: 150, height: 150)
        selfie.setImage(#imageLiteral(resourceName: "willThisWork"), for: .normal)
        selfie.contentMode = .scaleAspectFit
        selfie.layer.cornerRadius = 75
        selfie.layer.borderWidth = 5
        selfie.clipsToBounds = true
        selfie.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        selfie.addTarget(self, action:#selector(self.selfiePressed), for: .touchUpInside)
        self.view.addSubview(selfie)
        
        
        desctextView.frame = CGRect(x: 10, y: selfie.frame.maxY + 10, width: self.view.bounds.width - 20, height: self.view.bounds.height - (selfie.frame.maxY + 45))
        desctextView.delegate = self
        desctextView.textAlignment = .left
        desctextView.textColor = UIColor.black
        desctextView.text = "Hi! \nMy name is Jonathan Kopp, i'm an iOS developer and currently a first year student at Make School in San Francisco. FingerStyle is an app that combines two of my biggest passions, guitar and programming. I created this app to help beginner to experienced guitar players master any song they want. Learning guitar can be expensive, difficult, and make you want to quit. FingerStyle was made to make learning a new song as easy as possible. I combined every tool and tip I learned across my guitar journey into this app. I hope you love this app as much as I do!"
        desctextView.font = UIFont(name: "Avenir-Medium", size: 20)
        desctextView.isSelectable = true
        desctextView.layer.cornerRadius = 10
        desctextView.autocorrectionType = .yes
        desctextView.spellCheckingType = UITextSpellCheckingType.yes
        desctextView.isEditable = false
        desctextView.keyboardType = UIKeyboardType.default
        desctextView.returnKeyType = .done
        
        desctextView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.08)
        self.view.addSubview(desctextView)
        
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(self.singleTapAction(_:)))
        singleTap.numberOfTapsRequired = 1
        desctextView.addGestureRecognizer(singleTap)
        
    }
    
     @objc func singleTapAction(_ sender: UITapGestureRecognizer)
    {
        timer.invalidate()
        timerActive = false
        
        selfie.frame = CGRect(x: self.view.bounds.width/2 - 75, y: self.navView.frame.maxY + 10, width: 150, height: 150)
        selfie.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    }
    @objc func backPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func selfiePressed()
    {
         self.timer.invalidate()
        scheduledTimerWithTimeInterval()
    }
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "drawBack" with the interval of 1 seconds
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: {_ in
            self.updatePic()
            self.timerActive = true
            
            
            
        })
        
        
    }
    
    
    func moveImg()
    {
        //selfie.removeFromSuperview()
        if(self.timerActive)
        {
        if(self.direction == 0)
        {
            if(selfie.frame.maxX < self.view.bounds.width)
            {
                selfie.frame = CGRect(x: selfie.frame.minX + 4, y: self.navView.frame.maxY + 10, width: 150, height: 150)
                
            }else{
                self.direction = 1
                //return
            }
            
        }else{
            if(self.selfie.frame.minX >= 0)
            {
                self.selfie.frame = CGRect(x: self.selfie.frame.minX - 4, y: self.navView.frame.maxY + 10, width: 150, height: 150)
                
            }else{
                self.direction = 0
            }
        }
        }
        return
    }
    
    func updatePic()
    {
        if (ctr >= 1){
            ctr=0.0
        }
        else
        {
            ctr += 0.01
        }
        let thecolor = UIColor(hue: CGFloat(ctr), saturation: 1, brightness: 1, alpha: 1)
        selfie.layer.borderColor = thecolor.cgColor
        self.moveImg()
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        timer.invalidate()
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
            
        }
}
}
