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
    var admin = true
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
        desctextView.font = UIFont(name: "Avenir-Book", size: 20)
        desctextView.isSelectable = true
        desctextView.layer.cornerRadius = 10
        desctextView.autocorrectionType = .yes
        desctextView.spellCheckingType = UITextSpellCheckingType.yes
        desctextView.isEditable = false
        desctextView.keyboardType = UIKeyboardType.default
        desctextView.returnKeyType = .done
        desctextView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        desctextView.sizeToFit()
        self.view.addSubview(desctextView)
        
        
        let contactButton = UIButton()
        contactButton.frame = CGRect(x: self.view.bounds.width/2 - 90, y: desctextView.frame.maxY + 5, width: 180, height: 50)
        contactButton.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        contactButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 20.0)
        contactButton.titleLabel?.adjustsFontSizeToFitWidth = true
        contactButton.setTitle("Contact", for: .normal)
        contactButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        contactButton.addTarget(self, action:#selector(self.contactPressed), for: .touchUpInside)
        contactButton.layer.cornerRadius = 20
        contactButton.layer.borderWidth = 2
        contactButton.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        self.view.addSubview(contactButton)
    }
    @objc func contactPressed()
    {
        if(admin == false)
        {
        let url = NSURL(string: "mailto:jonathan.kopp@students.makeschool.com")
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url! as URL, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
            UIApplication.shared.openURL(url! as URL)
        }
        }
        else{
            split()
            
        }
    }
    @objc func backPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }
var songName = "He's a Pirate"
var artistName = "Hans Zimmer"
var difficulty = "Intermediate"
var theDescription = "From Pirates of the Caribbean"
var tab = ("""
    e|--------------------------------------------------|
    B|--------------------------------------------------|
    G|--------------------------------------------------|
    D|--------------------------------------------------|
    A|-5---5-5--5-5--5-5-5---5---5-5--5-5--5-5-5--------|
    E|--------------------------------------------------|
    
    e|--------------------------------------------------|
    B|--------------------------------------------------|
    G|---------------------------------------------7----|
    D|--------------------------------------------------|
    A|-5---5-5--5-5--5-5-5---5---5-5--5-5--5-5-5---5----|
    E|--------------------------------------------------|
    
    e|--------------------------------------------------|
    B|-------------5-6-6---6-8-5-5----------------------|
    G|---5-7-7---7-------------------7-5-5h7------------|
    D|-7------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|-------------5-6-6---6-8-5-5----------------------|
    G|---5-7-7---7-------------------7-5-7~~------------|
    D|-7------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|-----------------------5-6-6---5---5--------------|
    B|-------------6-8-8---8-----------8----------------|
    G|---5-7-7---7-------------------------7------------|
    D|-7------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|----------5-6-------------------------------------|
    B|---6-8-8------------6-5-5-------------------------|
    G|-7------------7---7---------7-5-5h7---------------|
    D|--------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|
    
    e|--------------------------------------------------|
    B|-------------5-6-6---6-8-5-5----------------------|
    G|---5-7-7---7-------------------7-5-5h7------------|
    D|-7------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|-------------5-6-6---6-8-5-5----------------------|
    G|---5-7-7---7-------------------7-5-7~~------------|
    D|-7------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|
    
    e|-----------------------5-6-6---5---5--------------|
    B|-------------6-8-8---8-----------8----------------|
    G|---5-7-7---7-------------------------7------------|
    D|-7------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|----------5-6-------------------------------------|
    B|---6-8-8------------6-5-5-------------------------|
    G|-7------------7---7---------7-5-7-----------------|
    D|--------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|-------------------1------------------------------|
    B|---4/5-6-6-8--10-----3----------------------------|
    G|-7-----7-7-7---7-------2--------------------------|
    D|--------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|-6------------------------------------------------|
    B|-6-6----------------------------------------------|
    G|-----7-----7-7-7-10-------------------------------|
    D|-------8---7-7-7--7-------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|-10-10-10-11-10---8-8-8-8-10----------------------|
    G|-10-10-10---------9-9-9---------------------------|
    D|--------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|-10-10-10-11-10---6/8-6-5-------------------------|
    G|-10-10-10---------7/9-7---7-----------------------|
    D|--------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|--------8-10-8---------8-10-8---------------------|
    G|-7-9-10--------10-9-10----------------------------|
    D|--------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|-----3-----3-----1--------------------------------|
    G|---2-----2-----0-------2--------------------------|
    D|-0-----0-------------3----------------------------|
    A|-------------3------------------------------------|
    E|-------------------3------------------------------|
    
    e|--------------------------------------------------|
    B|----8-10-8----------------------------------------|
    G|-10--------10-9-10-9-7-9-5-7----------------------|
    D|--------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|-----------------3-----3--------------------------|
    G|-----0-----2---2-----2----------------------------|
    D|---2-----0---0-----0------------------------------|
    A|-3-----0------------------------------------------|
    E|--------------------------------------------------|
    
    e|--------------------------------------------------|
    B|-------------8----8-10-8--------------------------|
    G|-7-9-10-9-10---10--------10-7---------------------|
    D|--------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|-----3-----3-----1--------------------------------|
    G|---2-----2-----0-------2--------------------------|
    D|-0-----0-------------3----------------------------|
    A|-------------3------------------------------------|
    E|-------------------3------------------------------|
    
    e|--------------------------------------------------|
    B|--------8--10-8--------8--------------------------|
    G|-7-9-10---------7-9-10---9-7-9-5------------------|
    D|--------------------------------------------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|--------------------------------------------------|
    G|-----3-----3-----5-----5--------------------------|
    D|---------5-----7-----7----------------------------|
    A|---5----------------------------------------------|
    E|-3-----3-----5-----5------------------------------|

    e|--------------------------------------------------|
    B|-10-11--------------------------------------------|
    G|--7-10-14-14-14-14-12---12-10-9-10-9-7------------|
    D|-------15-15-15-15------12-10-7--7-7-7------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|--------------------------------------------------|
    B|-10-11--------------------------------------------|
    G|--7-10-14-14-14-14-12---12-10-9-10-9-7------------|
    D|-------15-15-15-15------12-10-7--7-7-7------------|
    A|--------------------------------------------------|
    E|--------------------------------------------------|

    e|-------------------------------------------------------|
    B|-------10-------11--------10-10-10-10-8----8-6-5-6-5---|
    G|-----10-------10-------10-10-10-10-10-8----9-7-7-----7-|
    D|---12-------12-------12--------------------------------|
    A|-12-------12-------12----------------------------------|
    E|-------------------------------------------------------|

    e|-------------------------------------------------------|
    B|-------10-------11--------10-10-10-10-8----8-6-5-6-5---|
    G|-----10-------10-------10-10-10-10-10-8----9-7-7-----7-|
    D|---12-------12-------12--------------------------------|
    A|-12-------12-------12----------------------------------|
    E|-------------------------------------------------------|
""")
    var ar = [String]()
    func split()
    {
        var ctr = 0
        var prevChar = ""
        var tabLine = ""
        for i in tab{
            tabLine.append(i)
            if(i == "\n" && prevChar != "|")
            {
                ctr += 1
                ar.append(tabLine)
                tabLine = ""
            }
            prevChar = String(i)
        }
        removeNewLines()
    }
    
    
    func removeNewLines()
    {
        var ctr = 0
        while(ctr < ar.count){
            
            ar[ctr].removeLast()
            ctr += 1
        }
        splitIntoObj(currentIndex: 0)
    }
    
    struct tabObj{
        var E = String()
        var A = String()
        var D = String()
        var G = String()
        var B = String()
        var ee = String()
    }
    
    var tabs = [tabObj]()
    func splitIntoObj(currentIndex: Int)
    {
        var tabToAdd = tabObj()
        var whichString = ""
        var line = ""
        for i in ar[currentIndex]
        {
            if(i == "e")
            {
                print("Yup")
                whichString = "e"
            }
            else if(i == "B")
            {
                whichString = "B"
            }
            else if(i == "G")
            {
                whichString = "G"
            }
            else if(i == "D")
            {
                whichString = "D"
            }
            else if(i == "A")
            {
                whichString = "A"
            }
                
            else if(i == "E")
            {
                whichString = "E"
            }
            
            
            if(whichString == "e")
            {
                if(i != "\n")
                {
                    if(i != "e")
                    {
                        line.append(i)
                    }
                }else{
                    tabToAdd.ee = line
                    line = ""
                }
            }
            else if(whichString == "B")
            {
                if(i != "\n")
                {
                    if(i != "B")
                    {
                        line.append(i)
                    }
                }else{
                    tabToAdd.B = line
                    line = ""
                }
            }
            else if(whichString == "G")
            {
                if(i != "\n")
                {
                    if(i != "G")
                    {
                        line.append(i)
                    }
                }else{
                    tabToAdd.G = line
                    line = ""
                }
            }
            else if(whichString == "D")
            {
                if(i != "\n")
                {
                    if(i != "D")
                    {
                        line.append(i)
                    }
                }else{
                    tabToAdd.D = line
                    line = ""
                }
            }
            else if(whichString == "A")
            {
                if(i != "\n")
                {
                    if(i != "A")
                    {
                        line.append(i)
                    }
                }else{
                    tabToAdd.A = line
                    line = ""
                }
            }
                
            else if(whichString == "E")
            {
                if(i != "\n")
                {
                    if(i != "E")
                    {
                        line.append(i)
                    }
                }else{
                    tabToAdd.E = line
                    line = ""
                    tabs.append(tabToAdd)
                    if(currentIndex < ar.count - 1)
                    {
                        splitIntoObj(currentIndex: currentIndex + 1)
                    }else{
                        removeSpecialChars()
                    }
                }
            }
        }
    }
    
    func removeSpecialChars()
    {
        var ctr = 0
        while(ctr < tabs.count)
        {
            tabs[ctr].E = specialCharRemover(theString: tabs[ctr].E)
            tabs[ctr].A = specialCharRemover(theString: tabs[ctr].A)
            tabs[ctr].D = specialCharRemover(theString: tabs[ctr].D)
            tabs[ctr].G = specialCharRemover(theString: tabs[ctr].G)
            tabs[ctr].B = specialCharRemover(theString: tabs[ctr].B)
            tabs[ctr].ee = specialCharRemover(theString: tabs[ctr].ee)
            ctr += 1
        }
        appendToarray()
    }
    func specialCharRemover(theString: String) -> String
    {
        var newString = theString
        newString = newString.replacingOccurrences(of: "|", with: "")
        newString = newString.replacingOccurrences(of: "h", with: "-")
        
        newString = newString.replacingOccurrences(of: "p", with: "-")
        newString = newString.replacingOccurrences(of: "g", with: "-")
        newString = newString.replacingOccurrences(of: "--", with: "-")
        newString = newString.replacingOccurrences(of: "/", with: "-")
        newString = newString.replacingOccurrences(of: "~", with: "-")
        //newString = newString.replacingOccurrences(of: "-", with: "   ")
        return newString
    }
    
    struct songArrObj{
        var E = [String]()
        var A = [String]()
        var D = [String]()
        var G = [String]()
        var B = [String]()
        var ee = [String]()}
    
    var songArr = songArrObj()
    
    func appendToarray()
    {
        var ctr = 0
        while(ctr < tabs.count)
        {
            songArr.E += (tabs[ctr].E.components(separatedBy: "-"))
            songArr.A += (tabs[ctr].A.components(separatedBy: "-"))
            songArr.D += (tabs[ctr].D.components(separatedBy: "-"))
            songArr.G += (tabs[ctr].G.components(separatedBy: "-"))
            songArr.B += (tabs[ctr].B.components(separatedBy: "-"))
            songArr.ee += (tabs[ctr].ee.components(separatedBy: "-"))
            ctr += 1
        }
        //print(songArr.ee)
        //print(songArr.B)
        //print(songArr.G)
        //print(songArr.D)
        //print(songArr.A)
        //print(songArr.E)
        getAndFixSizing()
    }
    
    func getAndFixSizing()
    {
        var max = songArr.E.count
        if(max < songArr.A.count)
        {
            max = songArr.A.count
        }
        if(max < songArr.D.count)
        {
            max = songArr.D.count
        }
        if(max < songArr.G.count)
        {
            max = songArr.G.count
        }
        if(max < songArr.B.count)
        {
            max = songArr.B.count
        }
        if(max < songArr.ee.count)
        {
            max = songArr.ee.count
        }
        
        fixArrSizing(max: max)
    }
    
    func fixArrSizing(max: Int)
    {
        while(songArr.E.count < max)
        {
            songArr.E.append("")
        }
        while(songArr.A.count < max)
        {
            songArr.A.append("")
        }
        while(songArr.D.count < max)
        {
            songArr.D.append("")
        }
        while(songArr.G.count < max)
        {
            songArr.G.append("")
        }
        while(songArr.B.count < max)
        {
            songArr.B.append("")
        }
        while(songArr.ee.count < max)
        {
            songArr.ee.append("")
        }
        equalCharacterLengths()
    }
    
    func equalCharacterLengths()
    {
        var ctr = 0
        while(ctr < songArr.E.count)
        {
            //E
            if(songArr.E[ctr].count == 0)
            {
                songArr.E[ctr] += "  "
                
            }else if(songArr.E[ctr].count == 1)
            {
                songArr.E[ctr] += " "
            }else if(songArr.E[ctr].count > 2)
            {
                songArr.E[ctr] = "  "
            }
            //A
            if(songArr.A[ctr].count == 0)
            {
                songArr.A[ctr] += "  "
                
            }else if(songArr.A[ctr].count == 1)
            {
                songArr.A[ctr] += " "
            }else if(songArr.A[ctr].count > 2)
            {
                songArr.A[ctr] = "  "
            }
            //D
            if(songArr.D[ctr].count == 0)
            {
                songArr.D[ctr] += "  "
                
            }else if(songArr.D[ctr].count == 1)
            {
                songArr.D[ctr] += " "
            }else if(songArr.D[ctr].count > 2)
            {
                songArr.D[ctr] = "  "
            }
            //G
            if(songArr.G[ctr].count == 0)
            {
                songArr.G[ctr] += "  "
                
            }else if(songArr.G[ctr].count == 1)
            {
                songArr.G[ctr] += " "
            }else if(songArr.G[ctr].count > 2)
            {
                songArr.G[ctr] = "  "
            }
            //B
            if(songArr.B[ctr].count == 0)
            {
                songArr.B[ctr] += "  "
                
            }else if(songArr.B[ctr].count == 1)
            {
                songArr.B[ctr] += " "
            }else if(songArr.B[ctr].count > 2)
            {
                songArr.B[ctr] = "  "
            }
            //e
            if(songArr.ee[ctr].count == 0)
            {
                songArr.ee[ctr] += "  "
                
            }else if(songArr.ee[ctr].count == 1)
            {
                songArr.ee[ctr] += " "
            }else if(songArr.ee[ctr].count > 2)
            {
                songArr.ee[ctr] = "  "
            }
            
            ctr += 1
        }
        joinArray()
        
    }
    var finalSongTab = tabObj()
    func joinArray()
    {
        finalSongTab.E = songArr.E.joined(separator: "-")
        
        finalSongTab.A = songArr.A.joined(separator: "-")
        
        finalSongTab.D = songArr.D.joined(separator: "-")
        
        finalSongTab.G = songArr.G.joined(separator: "-")
        
        finalSongTab.B = songArr.B.joined(separator: "-")
        
        finalSongTab.ee = songArr.ee.joined(separator: "-")
        
        uploadToFirebase()
    }
    
    func uploadToFirebase()
    {
        let ref2 = Database.database().reference().childByAutoId().key! + songName
        
        let ref = Database.database().reference().child("Songs").child(ref2)
        ref.child("e").setValue(self.finalSongTab.E)
        ref.child("a").setValue(self.finalSongTab.A)
        ref.child("d").setValue(self.finalSongTab.D)
        ref.child("g").setValue(self.finalSongTab.G)
        ref.child("b").setValue(self.finalSongTab.B)
        ref.child("ee").setValue(self.finalSongTab.ee)
        
        ref.child("theUid").setValue(ref2)
        ref.child("theSongName").setValue(songName)
        ref.child("theArtist").setValue(artistName)
        ref.child("theDifficulty").setValue(difficulty)
        ref.child("theDescription").setValue(theDescription)
        
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
            
        }
    }
}
