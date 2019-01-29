

import UIKit
import Firebase
class editView: UIViewController, UITextFieldDelegate {
    var navView = UIView()
    var songName = String()
    var artistName = String()
    var difficulty = String()
    var tabs = [SongTabObj]()
    var currentTab = SongTabObj()
    var theDescription = String()
    var oldTab = SongTabObj()
    var oldTabIndex = IndexPath()
    
    //Views used throughout program
    var eLine = UIView(); var eL = UILabel(); var e = UILabel()
    var aLine = UIView(); var aL = UILabel(); var a = UILabel()
    var dLine = UIView(); var dL = UILabel(); var d = UILabel()
    var gLine = UIView(); var gL = UILabel(); var g = UILabel()
    var bLine = UIView(); var bL = UILabel(); var b = UILabel()
    var eeLine = UIView(); var eeL = UILabel(); var ee = UILabel()
    
    var eField = UITextField()
    var aField = UITextField()
    var dField = UITextField()
    var gField = UITextField()
    var bField = UITextField()
    var eeField = UITextField()
    
    var currentNote = Int()
    var nextbutton = UIButton()
    var doneButton = UIButton()
    var songTable = CreateSongTableVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height * 0.1))
        navView.backgroundColor = #colorLiteral(red: 0.2392156863, green: 0.6745098039, blue: 0.968627451, alpha: 1)
        navView.isOpaque = true
        
        self.view.addSubview(navView)
        
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
        
        let label = UILabel(frame: CGRect(x:30, y: navView.bounds.height/2-10, width: navView.bounds.width-60, height: 50))
        label.attributedText = song
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        let backbutton = UIButton(frame: CGRect(x: 5, y: label.frame.minY + 12.5, width: 25, height: 25))
        backbutton.setImage(#imageLiteral(resourceName: "back_arrow"), for: .normal)
        backbutton.addTarget(self, action:#selector(self.backPressed), for: .touchUpInside)
        navView.addSubview(backbutton)
        navView.addSubview(label)
        
        
        
        
        
        self.view.addSubview(navView)
        setUpViews()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        checkMaxLength(textField: textField)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    func checkMaxLength(textField: UITextField!) {
        if (textField.text!.count >= 2) {
            textField.deleteBackward()
        }
    }
    func setUpViews()
    {
        eL.text = "E"; eL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); eL.adjustsFontSizeToFitWidth = true
        aL.text = "A"; aL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); aL.adjustsFontSizeToFitWidth = true
        dL.text = "D"; dL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); dL.adjustsFontSizeToFitWidth = true
        gL.text = "G"; gL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); gL.adjustsFontSizeToFitWidth = true
        bL.text = "B"; bL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1); bL.adjustsFontSizeToFitWidth = true
        eeL.text = "e";eeL.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1);eeL.adjustsFontSizeToFitWidth = true
        
        e.text = "";currentTab.e = ""
        a.text = "";currentTab.a = ""
        d.text = "";currentTab.d = ""
        g.text = "";currentTab.g = ""
        b.text = "";currentTab.b = ""
        ee.text = "";currentTab.ee = ""
        
        
        //eadgbe ebgdae
        eeLine.frame = CGRect(x: 10, y: navView.frame.maxY + 20, width: self.view.bounds.width-20, height: 2.5)
        eeL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        ee.frame = CGRect(x: 5, y: -10, width: eeLine.frame.width - 10, height: 20)
        // e.text = "1 2 3 4 5 6 7 8 9 10"
        ee.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ee.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        ee.textAlignment = .left
        //ee.sizeToFit()
        ee.adjustsFontSizeToFitWidth = true
        eeLine.addSubview(ee)
        eeLine.addSubview(eeL)
        
        bLine.frame = CGRect(x: 10, y: eeLine.frame.maxY + 40, width: self.view.bounds.width-20, height: 2.5)
        bL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        b.frame = CGRect(x: 5, y: -10, width: bLine.frame.width - 10, height: 20)
        //a.text = "12 2 3 4 5 6 7 8 9 10"
        b.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        b.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        b.textAlignment = .left
        // b.sizeToFit()
        b.adjustsFontSizeToFitWidth = true
        bLine.addSubview(b)
        bLine.addSubview(bL)
        
        gLine.frame = CGRect(x: 10, y: bLine.frame.maxY + 40, width: self.view.bounds.width-20, height: 2.5)
        gL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        g.frame = CGRect(x: 5, y: -10, width: gLine.frame.width - 10, height: 20)
        //d.text = "13 2 3 4 5 6 7 8 9 10"
        g.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        g.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        g.textAlignment = .left
        //g.sizeToFit()
        g.adjustsFontSizeToFitWidth = true
        gLine.addSubview(g)
        gLine.addSubview(gL)
        
        dLine.frame = CGRect(x: 10, y: gLine.frame.maxY + 40, width: self.view.bounds.width-20, height: 2.5)
        dL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        d.frame = CGRect(x: 5, y: -10, width: dLine.frame.width - 10, height: 20)
        //g.text = "14 2 3 4 5 6 7 8 9 10"
        d.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        d.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        d.textAlignment = .left
        //d.sizeToFit()
        d.adjustsFontSizeToFitWidth = true
        dLine.addSubview(d)
        dLine.addSubview(dL)
        
        aLine.frame = CGRect(x: 10, y: dLine.frame.maxY + 40, width: self.view.bounds.width-20, height: 2.5)
        aL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        a.frame = CGRect(x: 5, y: -10, width: aLine.frame.width - 10, height: 20)
        //b.text = "15 2 3 4 5 6 7 8 9 10"
        a.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        a.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        a.textAlignment = .left
        //a.sizeToFit()
        //b.adjustsFontSizeToFitWidth = true
        aLine.addSubview(a)
        aLine.addSubview(aL)
        
        eLine.frame = CGRect(x: 10, y: aLine.frame.maxY + 40, width: self.view.bounds.width-20, height: 2.5)
        eL.frame = CGRect(x: -10, y: -10, width: 15, height: 20)
        e.frame = CGRect(x: 5, y: -10, width: eLine.frame.width - 10, height: 20)
        
        e.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        e.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        e.textAlignment = .left
        
        eLine.addSubview(e)
        eLine.addSubview(eL)
        
        eLine.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        aLine.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        dLine.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        gLine.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        bLine.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        eeLine.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        
        view.addSubview(eLine)
        view.addSubview(aLine)
        view.addSubview(dLine)
        view.addSubview(gLine)
        view.addSubview(bLine)
        view.addSubview(eeLine)
        
        
        
        textViews()
        
        doneButton = UIButton(frame: CGRect(x: 100, y: self.view.bounds.height - 70, width: view.bounds.width - 200, height: 50))
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
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
            
        }
    }
    @objc func donePressed()
    {
        let controller = CreateViewDone()
        controller.artistName = artistName
        controller.songName = songName
        controller.difficulty = difficulty
        //controller.theSong = tabs
        controller.fullSong = currentTab
        controller.theDescription = theDescription
        self.present(controller, animated: false, completion: nil)
    }
    
    func nextTab()
    {
        nextbutton.removeFromSuperview()
        e.text = ""
        a.text = ""
        d.text = ""
        g.text = ""
        b.text = ""
        ee.text = ""
        
        flattenSong()
        
    }
    func flattenSong()
    {
        let newSongTab = SongTabObj()
        tabs[oldTabIndex.row] = currentTab
        for i in tabs
        {
            newSongTab.theE.append(contentsOf: i.theE)
            newSongTab.theA.append(contentsOf: i.theA)
            newSongTab.theD.append(contentsOf: i.theD)
            newSongTab.theG.append(contentsOf: i.theG)
            newSongTab.theB.append(contentsOf: i.theB)
            newSongTab.theEE.append(contentsOf: i.theEE)
            
        }
        let controller = CreateViewDone()
        controller.artistName = artistName
        controller.songName = songName
        controller.difficulty = difficulty
        controller.fullSong = newSongTab
        controller.theDescription = theDescription
        self.present(controller, animated: false, completion: nil)
    }
    func addNotes()
    {
        let empty = "  -"
        let oneOnly = " -"
        
        if(eField.frame.minX<self.view.bounds.width)
        {
            if(eField.text?.count == 0)
            {
                currentTab.e.append(empty)
                currentTab.theE.append("  ")
                e.text = e.text! + ("  " + spacingBetweenNotes())
            }else if(eField.text?.count == 1)
            {
                currentTab.e.append(eField.text! + oneOnly)
                currentTab.theE.append(eField.text! + " ")
                e.text = e.text! + (eField.text! + " " + spacingBetweenNotes())
            }else
            {
                currentTab.e.append(eField.text! + "-")
                currentTab.theE.append(eField.text!)
                e.text = e.text! + (eField.text! + spacingBetweenNotes())
            }
            e.removeFromSuperview()
            e.adjustsFontSizeToFitWidth = true
            e.sizeToFit()
            self.eLine.addSubview(e)
            
            if(aField.text?.count == 0)
            {
                currentTab.a.append(empty)
                currentTab.theA.append("  ")
                a.text = a.text! + ("  " + spacingBetweenNotes())
            }else if(aField.text?.count == 1)
            {
                currentTab.a.append(aField.text! + oneOnly)
                currentTab.theA.append(aField.text! + " ")
                a.text = a.text! + (aField.text! + " " + spacingBetweenNotes())
            }else
            {
                currentTab.a.append(eField.text! + "-")
                currentTab.theA.append(aField.text!)
                a.text = a.text! + (aField.text! + spacingBetweenNotes())
            }
            a.removeFromSuperview()
            a.adjustsFontSizeToFitWidth = true
            a.sizeToFit()
            self.aLine.addSubview(a)
            
            if(dField.text?.count == 0)
            {
                currentTab.d.append(empty)
                currentTab.theD.append("  ")
                d.text = d.text! + ("  " + spacingBetweenNotes())
            }else if(dField.text?.count == 1)
            {
                currentTab.d.append(dField.text! + oneOnly)
                currentTab.theD.append(dField.text! + " ")
                d.text = d.text! + (dField.text! + " " + spacingBetweenNotes())
            }else
            {
                currentTab.d.append(dField.text! + "-")
                currentTab.theD.append(dField.text!)
                d.text = d.text! + (dField.text! + spacingBetweenNotes())
            }
            d.removeFromSuperview()
            d.adjustsFontSizeToFitWidth = true
            d.sizeToFit()
            self.dLine.addSubview(d)
            
            if(gField.text?.count == 0)
            {
                currentTab.g.append(empty)
                currentTab.theG.append("  ")
                g.text = g.text! + ("  " + spacingBetweenNotes())
            }else if(gField.text?.count == 1)
            {
                currentTab.g.append(gField.text! + oneOnly)
                currentTab.theG.append(gField.text! + " ")
                g.text = g.text! + (gField.text! + " " + spacingBetweenNotes())
            }else
            {
                currentTab.g.append(gField.text! + "-")
                currentTab.theG.append(gField.text!)
                g.text = g.text! + (gField.text! + spacingBetweenNotes())
            }
            g.removeFromSuperview()
            g.adjustsFontSizeToFitWidth = true
            g.sizeToFit()
            self.gLine.addSubview(g)
            
            if(bField.text?.count == 0)
            {
                currentTab.b.append(empty)
                currentTab.theB.append("  ")
                b.text = b.text! + ("  " + spacingBetweenNotes())
            }else if(bField.text?.count == 1)
            {
                currentTab.b.append(bField.text! + oneOnly)
                currentTab.theB.append(bField.text! + " ")
                b.text = b.text! + (bField.text! + " " + spacingBetweenNotes())
            }else
            {
                currentTab.b.append(bField.text! + "-")
                currentTab.theB.append(bField.text!)
                b.text = b.text! + (bField.text! + spacingBetweenNotes())
            }
            b.removeFromSuperview()
            b.adjustsFontSizeToFitWidth = true
            b.sizeToFit()
            self.bLine.addSubview(b)
            
            if(eeField.text?.count == 0)
            {
                currentTab.ee.append(empty)
                currentTab.theEE.append("  ")
                ee.text = ee.text! + ("  " + spacingBetweenNotes())
            }else if(eeField.text?.count == 1)
            {
                currentTab.ee.append(eeField.text! + oneOnly)
                currentTab.theEE.append(eeField.text! + " ")
                ee.text = ee.text! + (eeField.text! + " " + spacingBetweenNotes())
            }else
            {
                currentTab.ee.append(eeField.text! + "-")
                currentTab.theEE.append(eeField.text!)
                ee.text = ee.text! + (eeField.text! + spacingBetweenNotes())
            }
            ee.removeFromSuperview()
            ee.adjustsFontSizeToFitWidth = true
            ee.sizeToFit()
            self.eeLine.addSubview(ee)
        }
        
        
    }
    
    
    
    
    
    func spacingBetweenNotes()->String
    {
        return "  "
    }
    func textViews()
    {
        eField = layoutTextViews()
        aField = layoutTextViews()
        dField = layoutTextViews()
        gField = layoutTextViews()
        bField = layoutTextViews()
        eeField = layoutTextViews()
        let thex = eLine.frame.minX + (CGFloat(currentNote) * (self.view.bounds.width / CGFloat(getNotesPerLine())) + 17.5)
        
        eeField.frame = CGRect(x: thex + 10, y: eeLine.frame.midY - 17.5, width: 35, height: 35)
        bField.frame = CGRect(x: thex + 10, y: bLine.frame.midY - 17.5, width: 35, height: 35)
        gField.frame = CGRect(x: thex + 10, y: gLine.frame.midY - 17.5, width: 35, height: 35)
        dField.frame = CGRect(x: thex + 10, y: dLine.frame.midY - 17.5, width: 35, height: 35)
        aField.frame = CGRect(x: thex + 10, y: aLine.frame.midY - 17.5, width: 35, height: 35)
        eField.frame = CGRect(x: thex + 10, y: eLine.frame.midY - 17.5, width: 35, height: 35)
        
        if(eeField.frame.maxX <= self.view.bounds.width)
        {
            self.view.addSubview(eeField)
            self.view.addSubview(bField)
            self.view.addSubview(gField)
            self.view.addSubview(dField)
            self.view.addSubview(aField)
            self.view.addSubview(eField)
            
            nextbutton = UIButton(frame: CGRect(x: eField.frame.minX + 5, y: eLine.frame.maxY + 15, width: 25, height: 25))
            nextbutton.setImage(#imageLiteral(resourceName: "icons8-arrow-filled-50"), for: .normal)
            nextbutton.addTarget(self, action:#selector(self.nextPressed), for: .touchUpInside)
            self.view.addSubview(nextbutton)
            if(currentNote == 0)
            {
                songTable.removeFromParent()
                songTable = CreateSongTableVC()
                let theFrame = CGRect(x: 0, y: nextbutton.frame.maxY + 20, width: self.view.bounds.width, height: self.view.bounds.height - (nextbutton.frame.maxY + 100))
                songTable.fullSong = oldTab
                songTable.view.frame = theFrame
                songTable.size = theFrame
                songTable.viewDidLoad()
                songTable.createTempSong()
                self.addChild(songTable)
                self.view.addSubview(songTable.view)
            }
        }else{
            nextTab()
        }
    }
    func layoutTextViews() ->UITextField
    {
        let theTextField = UITextField()
        theTextField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        theTextField.isEnabled = true
        theTextField.font = UIFont(name: "CourierNewPS-BoldMT", size: 18)
        theTextField.keyboardType = UIKeyboardType.numberPad
        theTextField.returnKeyType = UIReturnKeyType.done
        theTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
        theTextField.contentVerticalAlignment = .center
        theTextField.contentHorizontalAlignment = .right
        theTextField.keyboardAppearance = .light
        theTextField.clearButtonMode = .never
        theTextField.delegate = self
        theTextField.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        theTextField.layer.cornerRadius = 5
        theTextField.layer.borderWidth = 2
        theTextField.layer.borderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        theTextField.textAlignment = .center
        theTextField.adjustsFontSizeToFitWidth = true
        return theTextField
    }
    @objc func nextPressed()
    {
        
        if(currentNote<getNotesPerLine() - 1)
        {
            addNotes()
            currentNote += 1
            eField.removeFromSuperview()
            aField.removeFromSuperview()
            dField.removeFromSuperview()
            gField.removeFromSuperview()
            bField.removeFromSuperview()
            eeField.removeFromSuperview()
            nextbutton.removeFromSuperview()
            
            
            textViews()
        }
    }
    @objc func backPressed()
    {
        let controller = CreateVC()
        controller.ArtistTextField.text = artistName
        controller.SongTextField.text = songName
        self.present(controller, animated: false, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
        super.touchesBegan(touches,  with: event)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    func getNotesPerLine() -> Int
    {
        //Should return how many notes before going to the next line.
        return Int((self.view.bounds.width / 20) / 2)
        
    }
}
