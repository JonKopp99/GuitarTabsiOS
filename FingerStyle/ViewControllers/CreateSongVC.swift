//
//  CreateSongVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/9/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit

class CreateSongVC: UIViewController, UITextFieldDelegate {
    var songName = String()
    var artistName = String()
    var difficulty = String()
    var tabs = [SongTabObj]()
    var currentTab = SongTabObj()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        print("Settings VC")
        let navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 80))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navView.isOpaque = true
       
        self.view.addSubview(navView)
        let song = NSMutableAttributedString(string: ("\"" + (songName) + "\""), attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-BoldItalic", size: 35)!, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        let splitter = NSMutableAttributedString(string: " - ", attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-Heavy", size: 32)!, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)])
        let artist = NSMutableAttributedString(string: artistName, attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Book", size: 30)!, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        song.append(splitter)
        song.append(artist)
        
        let label = UILabel(frame: CGRect(x:0, y: navView.bounds.height/2-10, width: navView.bounds.width, height: 50))
        label.attributedText = song
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
        setUpViews()
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
        eeLine.frame = CGRect(x: 10, y: 150, width: self.view.bounds.width-20, height: 2.5)
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
        
        let nexttabbutton = UIButton(frame: CGRect(x: eLine.frame.maxY, y: eLine.frame.maxY + 40, width: 35, height: 35))
        nexttabbutton.setImage(#imageLiteral(resourceName: "icons8-down-right-filled-50"), for: .normal)
        nexttabbutton.addTarget(self, action:#selector(self.nexttabPressed), for: .touchUpInside)
        self.view.addSubview(nexttabbutton)
    }
    
    @objc func nexttabPressed()
    {
        addNotes()
        tabs.append(currentTab)
        currentNote = 0
        eField.removeFromSuperview()
        aField.removeFromSuperview()
        dField.removeFromSuperview()
        gField.removeFromSuperview()
        bField.removeFromSuperview()
        eeField.removeFromSuperview()
        nextbutton.removeFromSuperview()
        textViews()
        currentTab.e = ""
        
        
    }
    
    func addNotes()
    {
        let empty = "  -"
        let oneOnly = " -"
        
        
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
        
        eeField.frame = CGRect(x: thex, y: -17.5, width: 35, height: 35)
        bField.frame = CGRect(x: thex, y: -17.5, width: 35, height: 35)
        gField.frame = CGRect(x: thex, y: -17.5, width: 35, height: 35)
        dField.frame = CGRect(x: thex, y: -17.5, width: 35, height: 35)
        aField.frame = CGRect(x: thex, y: -17.5, width: 35, height: 35)
        eField.frame = CGRect(x: thex, y: -17.5, width: 35, height: 35)
        
        eeLine.addSubview(eeField)
        bLine.addSubview(bField)
        gLine.addSubview(gField)
        dLine.addSubview(dField)
        aLine.addSubview(aField)
        eLine.addSubview(eField)
        
        nextbutton = UIButton(frame: CGRect(x: eField.frame.minX + 15, y: eLine.frame.maxY + 15, width: 25, height: 25))
        nextbutton.setImage(#imageLiteral(resourceName: "icons8-arrow-filled-50"), for: .normal)
        nextbutton.addTarget(self, action:#selector(self.nextPressed), for: .touchUpInside)
        self.view.addSubview(nextbutton)
    }
    func layoutTextViews() ->UITextField
    {
        let theTextField = UITextField()
        theTextField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        theTextField.isEnabled = true
        theTextField.font = UIFont(name: "CourierNewPS-BoldMT", size: 20)
        theTextField.autocorrectionType = UITextAutocorrectionType.yes
        theTextField.keyboardType = UIKeyboardType.numberPad
        theTextField.returnKeyType = UIReturnKeyType.done
        theTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
        theTextField.contentVerticalAlignment = .center
        theTextField.delegate = self
        theTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
    
    func getNotesPerLine() -> Int
    {
        //Should return how many notes before going to the next line.
        return Int((self.view.bounds.width / 20) / 2)
        
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
