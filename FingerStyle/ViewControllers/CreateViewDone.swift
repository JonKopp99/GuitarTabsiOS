//
//  CreateViewDone.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/10/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//


import UIKit
import Firebase

class CreateViewDone: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate{
    
    var songName = String()
    var artistName = String()
    var difficulty = String()
    var tableView = UITableView()
    var theSong = [SongTabObj]()
    var fullSong = SongTabObj()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTempSong()
        //let userDefaults = Foundation.UserDefaults.standard
        //userDefaults.set([], forKey: "Saved")
        //print((userDefaults.stringArray(forKey: "Saved") ?? [String]()))
        print(songName)
        self.view.backgroundColor = .white
        print("Saved VC")
        tableView.register(songTableViewCell.self, forCellReuseIdentifier: "songCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 150, width: self.view.bounds.width, height: self.view.bounds.height-150)
        tableView.allowsSelection = false
        
        
        self.view.backgroundColor = .white
        
        let navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let label = UILabel(frame: CGRect(x:30, y: navView.bounds.height / 2, width: navView.bounds.width - 60, height: 50))
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
        let song = NSMutableAttributedString(string: songName, attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-BoldItalic", size: 35)!, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        let splitter = NSMutableAttributedString(string: " - ", attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-Heavy", size: 32)!, NSAttributedString.Key.foregroundColor : theColor])
        let artist = NSMutableAttributedString(string: artistName, attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Book", size: 30)!, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        song.append(splitter)
        song.append(artist)
        label.attributedText = song
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        let backbutton = UIButton(frame: CGRect(x: 5, y: label.frame.midY - 12.5, width: 25, height: 25))
        backbutton.setImage(#imageLiteral(resourceName: "back_arrow"), for: .normal)
        backbutton.addTarget(self, action:#selector(self.backPressed), for: .touchUpInside)
        
        navView.addSubview(label)
        navView.addSubview(backbutton)
        self.view.addSubview(navView)
        
        let saveView = UIView(frame: CGRect(x: 0, y: navView.frame.maxY, width: view.bounds.width, height: 50))
        saveView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let saveButton = UIButton(frame: CGRect(x: self.view.bounds.width / 2 - (view.bounds.width * 0.2), y: 2.5, width: view.bounds.width * 0.4, height: 45))
        saveButton.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        saveButton.titleLabel?.font = UIFont(name: "AvenirNext-Heavy", size: 20.0)
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        saveButton.titleLabel?.adjustsFontSizeToFitWidth = true
        saveButton.addTarget(self, action:#selector(self.savePressed), for: .touchUpInside)
        saveButton.layer.cornerRadius = 20
        saveButton.layer.borderWidth = 2
        saveButton.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        saveView.addSubview(saveButton)
        self.view.addSubview(saveView)
        
        self.view.addSubview(tableView)
        
        
    }
    @objc func savePressed()
    {
        print("Saved Pressed")
        let ref2 = Database.database().reference().childByAutoId().key! + songName
        let userDefaults = Foundation.UserDefaults.standard
        var value = userDefaults.stringArray(forKey: "Saved") ?? [String]()
        userDefaults.set([], forKey: "Saved")
        print(value)
        if(value.count == 0)
        {
            print("Went into if")
            userDefaults.set([ref2], forKey: "Saved")
        }else{
            print("Went into else")
            value.append(ref2)
            userDefaults.set(value, forKey: "Saved")
        }
        print((userDefaults.stringArray(forKey: "Saved") ?? [String]()))
        let ref = Database.database().reference().child("Songs").child(ref2)
        ref.child("e").setValue(self.fullSong.e)
        ref.child("a").setValue(self.fullSong.a)
        ref.child("d").setValue(self.fullSong.d)
        ref.child("b").setValue(self.fullSong.g)
        ref.child("g").setValue(self.fullSong.b)
        ref.child("ee").setValue(self.fullSong.ee)
        
        ref.child("theUid").setValue(ref2)
        ref.child("theSongName").setValue(songName)
        ref.child("theArtist").setValue(artistName)
        ref.child("theDifficulty").setValue(difficulty)
        
    }
    @objc func backPressed()
    {
        print("Back Pressed")
        let controller = CreateVC()
        controller.ArtistTextField.text = artistName
        controller.SongTextField.text = songName
        self.present(controller, animated: false, completion: nil)
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("Getting Called")
        if gestureRecognizer is UITapGestureRecognizer {
            let location = touch.location(in: tableView)
            return (tableView.indexPathForRow(at: location) == nil)
        }
        return true
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getAmountOfLines()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as! songTableViewCell
        
        if(indexPath.row<theSong.count)
        {
            //print(theSong[indexPath.row].theE)
            //print(theSong[indexPath.row].e)
            
            cell.e.text = theSong[indexPath.row].e
            cell.a.text = theSong[indexPath.row].a
            cell.d.text = theSong[indexPath.row].d
            cell.g.text = theSong[indexPath.row].g
            cell.b.text = theSong[indexPath.row].b
            cell.ee.text = theSong[indexPath.row].ee
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }

    
    
    func calculateBPM()
    {
        //Should calculate how many notes per second
    }
    
    func getNotesPerLine() -> Int
    {
        //Should return how many notes before going to the next line.
        return Int((self.view.bounds.width / 20) / 2)
        
    }
    func getAmountOfLines() -> Int
    {
        //Calls NotesPerLine and BPM to return the amount of lines the table view should have
        let toReturn = Int(fullSong.theE.count / getNotesPerLine())
        return toReturn
    }
    
    func fillTableView()
    {
        //should get BPM and notesPerLine to figure out how/where to place all the notes
        //Divide the width / notesPerline to find out spacing between the notes.
        
    }
    func spacingBetweenNotes()->String
    {
        return "  "
    }
    
    
    func createTempSong()
    {
        checkSizing()
        
    }
    
    func checkSizing()
    {
        var max = fullSong.theE.count
        if(max < fullSong.theA.count)
        {
            max = fullSong.theA.count
        }
        if(max < fullSong.theD.count)
        {
            max = fullSong.theD.count
        }
        if(max < fullSong.theG.count)
        {
            max = fullSong.theG.count
        }
        if(max < fullSong.theB.count)
        {
            max = fullSong.theB.count
        }
        if(max < fullSong.theEE.count)
        {
            max = fullSong.theEE.count
        }
        fixSizing(themax: max)
    }
    
    func fixSizing(themax: Int)
    {
        let numNotesPerLine = getNotesPerLine()
        var max = themax
        print(max % numNotesPerLine) //1 for 21 % 10
        if(max % numNotesPerLine != 0)
        {
            let toAdd = numNotesPerLine - (max % numNotesPerLine)
            max += toAdd
        }
        
        while(fullSong.theE.count < max)
        {
            fullSong.theE.append("  ")
        }
        while(fullSong.theA.count < max)
        {
            fullSong.theA.append("  ")
        }
        while(fullSong.theD.count < max)
        {
            fullSong.theD.append("  ")
        }
        while(fullSong.theG.count < max)
        {
            fullSong.theG.append("  ")
        }
        while(fullSong.theB.count < max)
        {
            fullSong.theB.append("  ")
        }
        while(fullSong.theEE.count < max)
        {
            fullSong.theEE.append("  ")
        }
        print(fullSong.theE.count)
        print(fullSong.theA.count)
        print(fullSong.theD.count)
        print(fullSong.theG.count)
        print(fullSong.theB.count)
        print(fullSong.theEE.count)
        seperateIntoArray()
    }
    
    func seperateIntoArray()
    {
        let numLines = getAmountOfLines()
        let numNotes = getNotesPerLine() - 1
        
        var linectr = 0
        
        //Loops tab by tab
        while(linectr<numLines)
        {
            let first = linectr * numNotes
            let second = first + numNotes
            let newSongLine = SongTabObj()
            newSongLine.theE = Array(fullSong.theE[first..<second])
            newSongLine.e = ""
            newSongLine.theA = Array(fullSong.theA[first..<second])
            newSongLine.a = ""
            newSongLine.theD = Array(fullSong.theD[first..<second])
            newSongLine.d = ""
            newSongLine.theG = Array(fullSong.theG[first..<second])
            newSongLine.g = ""
            newSongLine.theB = Array(fullSong.theB[first..<second])
            newSongLine.b = ""
            newSongLine.theEE = Array(fullSong.theEE[first..<second])
            newSongLine.ee = ""
            
            theSong.append(newSongLine)
            
            linectr += 1
        }
        addSpacing()
        
        
    }
    
    func addSpacing()
    {
        //let spacing = spacingBetweenNotes()
        let spacing2 = spacingBetweenNotes()
        //spacing2.removeLast()
        //spacing2.removeLast()
        for i in theSong
        {
            for k in 0 ..< i.theE.count - 1
            {
                i.e = (i.e + i.theE[k] + spacing2)
                i.a = (i.a + i.theA[k] + spacing2)
                i.d = (i.d + i.theD[k] + spacing2)
                i.g = (i.g + i.theG[k] + spacing2)
                i.b = (i.b + i.theB[k] + spacing2)
                i.ee = (i.ee + i.theEE[k] + spacing2)
            }
            i.e = (i.e + i.theE[i.theE.count-1])
            i.a = (i.a + i.theA[i.theE.count-1])
            i.d = (i.d + i.theD[i.theE.count-1])
            i.g = (i.g + i.theG[i.theE.count-1])
            i.b = (i.b + i.theB[i.theE.count-1])
            i.ee = (i.ee + i.theEE[i.theE.count-1])
            print(i.e)
        }
    }
    
    
    
}

