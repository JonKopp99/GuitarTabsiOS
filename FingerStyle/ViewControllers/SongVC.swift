//
//  SongVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/8/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit
import Firebase

class SongVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate{

    var songName = String()
    var artistName = String()
    var difficulty = String()
    var tableView = UITableView()
    var theSong = [SongTabObj]()
    var fullSong = SongTabObj()
    var theUid = String()
    
    var currentTab = IndexPath()
    var timerLine = UIView()
    var playButton = UIButton()
    var speedMultiplier = CGFloat()
    var playing = Bool()
    var theBPM = CGFloat()
    var tempo = CGFloat()
    var landScape = Bool()
    var navView = UIView()
    var loopButton = UIButton()
    var infobutton = UIButton()
    var loop = Bool()
    var theDescription = String()
    var infoView = UIView()
    var discover = Bool()
    var admin = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height * 0.1))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let label = UILabel(frame: CGRect(x:30, y: navView.bounds.height / 2 - 10, width: navView.bounds.width - 60, height: 50))
        if(landScape)
        {
            label.frame = CGRect(x:25, y: navView.bounds.height / 2 - 25, width: navView.bounds.width - 50, height: 50)
        }
        createTempSong()
        
        self.view.backgroundColor = .white
        tableView.register(songTableViewCell.self, forCellReuseIdentifier: "songCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: navView.frame.maxY, width: self.view.bounds.width, height: self.view.bounds.height - (navView.frame.maxY + 50))
        tableView.allowsSelection = true
        
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(self.singleTapAction(_:)))
        singleTap.numberOfTapsRequired = 1
        tableView.addGestureRecognizer(singleTap)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeUp))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.navView.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDown))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.navView.addGestureRecognizer(swipeDown)
        
        self.view.backgroundColor = .white
        
       
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
        let song = NSMutableAttributedString(string: songName, attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-BoldItalic", size: 25)!, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
         let splitter = NSMutableAttributedString(string: " - ", attributes: [NSAttributedString.Key.font : UIFont(name: "AvenirNext-Heavy", size: 23)!, NSAttributedString.Key.foregroundColor : theColor])
        let artist = NSMutableAttributedString(string: artistName, attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Book", size: 20)!, NSAttributedString.Key.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        song.append(splitter)
        song.append(artist)
        label.attributedText = song
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        infobutton = UIButton(frame: CGRect(x: self.view.bounds.width - 30, y: label.frame.midY - 10, width: 25, height: 25))
        infobutton.setImage(#imageLiteral(resourceName: "icons8-info-50"), for: .normal)
        infobutton.addTarget(self, action:#selector(self.swipeDown), for: .touchUpInside)
        let backbutton = UIButton(frame: CGRect(x: 2.5, y: label.frame.midY - 15, width: 25, height: 25))
        if(landScape)
        {
            backbutton.frame = CGRect(x: 20, y: label.frame.midY - 15, width: 25, height: 25)
            infobutton.frame = CGRect(x: self.view.bounds.width - 40, y: label.frame.midY - 10, width: 25, height: 25)
        }
        backbutton.setImage(#imageLiteral(resourceName: "back_arrow"), for: .normal)
        backbutton.addTarget(self, action:#selector(self.backPressed), for: .touchUpInside)
        
        navView.addSubview(label)
        navView.addSubview(backbutton)
        navView.addSubview(infobutton)
        self.view.addSubview(navView)
        self.view.addSubview(tableView)
        
        
        timerLine.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.2)
        timerLine.frame = CGRect(x: 10, y: 30, width: 5, height: 145)
        self.tableView.addSubview(timerLine)
        
        speedMultiplier = 1
        playing = false
        currentTab = IndexPath(row: 0, section: 0)
        
        let buttonView = UIView()
        buttonView.frame = CGRect(x: 0, y: self.view.bounds.height - 50, width: self.view.bounds.width, height: 50)
        buttonView.backgroundColor = .clear
        
        playButton = UIButton(frame: CGRect(x: self.view.bounds.width / 2 - 25, y: -10, width: 45, height: 45))
        playButton.setImage(#imageLiteral(resourceName: "icons8-circled-play-50 (1)"), for: .normal)
        playButton.addTarget(self, action:#selector(self.playPressed), for: .touchUpInside)
        buttonView.addSubview(playButton)
        
        let slowDownButton = UIButton(frame: CGRect(x: playButton.frame.minX - 40, y: -5, width: 35, height: 35))
        slowDownButton.setImage(#imageLiteral(resourceName: "icons8-rewind-50"), for: .normal)
        slowDownButton.addTarget(self, action:#selector(self.slowDown), for: .touchUpInside)
        buttonView.addSubview(slowDownButton)
        
        let speedUpButton = UIButton(frame: CGRect(x: playButton.frame.maxX + 5, y: -5, width: 35, height: 35))
        speedUpButton.setImage(#imageLiteral(resourceName: "icons8-fast-forward-50"), for: .normal)
        speedUpButton.addTarget(self, action:#selector(self.speedUP), for: .touchUpInside)
        buttonView.addSubview(speedUpButton)
        
        let resetButton = UIButton(frame: CGRect(x: slowDownButton.frame.minX - 40, y: -5, width: 35, height: 35))
        resetButton.setImage(#imageLiteral(resourceName: "speedReset"), for: .normal)
        resetButton.addTarget(self, action:#selector(self.resetPressed), for: .touchUpInside)
        buttonView.addSubview(resetButton)
        
        loopButton = UIButton(frame: CGRect(x: speedUpButton.frame.maxX + 5, y: -5, width: 35, height: 35))
        loopButton.setImage(#imageLiteral(resourceName: "icons8-repeat-50 (1)"), for: .normal)
        loopButton.addTarget(self, action:#selector(self.loopPressed), for: .touchUpInside)
        buttonView.addSubview(loopButton)
        
        self.view.addSubview(buttonView)
        let swipeRight = UISwipeGestureRecognizer(target: self, action:#selector(self.swipeRight(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipeRight(_ sender: UISwipeGestureRecognizer){
        let location = (sender.location(in: self.tableView))
        if(location.x <= 100)
        {
//            let animation = CATransition()
//            animation.type = .fade
//            animation.duration = 0.3
//            animation.subtype = .fromLeft
//            self.view.window!.layer.add(animation, forKey: nil)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func infoPressed()
    {
            infoView.removeFromSuperview()
            infoView.frame = CGRect(x: 25, y: self.view.bounds.height * 0.1, width: self.view.bounds.width - 50, height: self.view.bounds.height * 0.1)
            infoView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.2)
            infoView.layer.cornerRadius = 15
//            let closeButton = UIButton()
//            closeButton.frame = CGRect(x: 5, y: 5, width: 25, height: 25)
//            closeButton.setImage(#imageLiteral(resourceName: "icons8-cancel-50 (1)").mask(with: #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)), for: .normal)
//            closeButton.addTarget(self, action:#selector(self.swipeUp), for: .touchUpInside)
        
            if(discover)
            {
                var saveButton = UIButton()
                if(admin)
                {
                    //Admin Button
                    saveButton = UIButton()
                    saveButton.frame = CGRect(x: self.view.bounds.width - 90, y: 5, width: 30, height: 30)
                    saveButton.setImage(#imageLiteral(resourceName: "icons8-plus-math-filled-50").mask(with: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)), for: .normal)
                    saveButton.addTarget(self, action:#selector(self.saveAdminPressed), for: .touchUpInside)
                    infoView.addSubview(saveButton)
                }else{
                    saveButton = UIButton()
                    saveButton.frame = CGRect(x: self.infoView.bounds.width - 30, y: 5, width: 25, height: 25)
                    saveButton.setImage(#imageLiteral(resourceName: "icons8-plus-50").mask(with: #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)), for: .normal)
                    saveButton.addTarget(self, action:#selector(self.savePressed), for: .touchUpInside)
                    infoView.addSubview(saveButton)
                }
            }else{
                let deleteButton = UIButton(frame: CGRect(x: self.infoView.bounds.width - 70, y: 5, width: 70, height: 20))
                deleteButton.backgroundColor = .clear
                deleteButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 18.0)
                deleteButton.setTitleColor(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), for: .normal)
                deleteButton.setTitle("Delete", for: .normal)
                deleteButton.titleLabel?.adjustsFontSizeToFitWidth = true
                deleteButton.addTarget(self, action:#selector(self.deletePressed), for: .touchUpInside)
                infoView.addSubview(deleteButton)
                
            }
            
            
            let desctextView  = UILabel()
            desctextView.frame = CGRect(x: 5, y: 0, width: infoView.bounds.width - 10, height: self.view.bounds.height * 0.1)
            desctextView.textAlignment = .left
            desctextView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            desctextView.text = theDescription
            if(theDescription == "")
            {
                desctextView.text = "No description provided for this song."
            }
            desctextView.font = UIFont(name: "Avenir-Book", size: 20)
            desctextView.layer.cornerRadius = 10
            desctextView.backgroundColor = .clear
            desctextView.adjustsFontSizeToFitWidth = true
            //infoView.addSubview(closeButton)
            infoView.addSubview(desctextView)
            self.navView.addSubview(infoView)
    }
    
    @objc func swipeUp()
    {
        UIView.animate(withDuration: 0.4, animations: {
            self.navView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.1)
            self.tableView.frame = CGRect(x: 0, y: self.view.bounds.height * 0.1, width: self.view.bounds.width, height: self.view.bounds.height - (self.view.bounds.height * 0.1 + 50))
            
        }, completion: { (finished: Bool) in
            self.infobutton.addTarget(self, action:#selector(self.swipeDown), for: .touchUpInside)
            self.infoView.removeFromSuperview()
        })
    }
    
    @objc func swipeDown()
    {
        UIView.animate(withDuration: 0.4, animations: {
            self.navView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.2)
            self.tableView.frame = CGRect(x: 0, y: self.view.bounds.height * 0.2, width: self.view.bounds.width, height: self.view.bounds.height - (self.view.bounds.height * 0.2 + 50))
            
            
        }, completion: { (finished: Bool) in
            self.infobutton.addTarget(self, action:#selector(self.swipeUp), for: .touchUpInside)
            self.infoPressed()
        })
        
    }
    
    @objc func deletePressed()
    {
        let userDefaults = Foundation.UserDefaults.standard
        var value = userDefaults.stringArray(forKey: "SavedSongs") ?? [String]()
        var ctr = 0
        for i in value
        {
            if(i == theUid)
            {
                userDefaults.set([], forKey: i)
                value.remove(at: ctr)
                userDefaults.set(value, forKey: "SavedSongs")
            }
            ctr += 1
        }
        let controller = SavedVC()
//        let animation = CATransition()
//        animation.type = .fade
//        animation.subtype = .fromBottom
//        animation.duration = 0.4
//        self.view.window!.layer.add(animation, forKey: nil)
        self.present(controller, animated: true, completion: nil)
        //uploadToDB()
    }
    
    @objc func saveAdminPressed()
    {
        let ref2 = Database.database().reference().childByAutoId().key! + songName
        let ref = Database.database().reference().child("PublishedSongs").child(ref2)
        ref.child("e").setValue(self.fullSong.e)
        ref.child("a").setValue(self.fullSong.a)
        ref.child("d").setValue(self.fullSong.d)
        ref.child("g").setValue(self.fullSong.g)
        ref.child("b").setValue(self.fullSong.b)
        ref.child("ee").setValue(self.fullSong.ee)
        
        ref.child("theUid").setValue(ref2)
        var songWithoutQuotes = songName
        songWithoutQuotes.removeFirst()
        songWithoutQuotes.removeLast()
        ref.child("theSongName").setValue(songWithoutQuotes)
        ref.child("theArtist").setValue(artistName)
        ref.child("theDifficulty").setValue(difficulty)
        ref.child("theDescription").setValue(theDescription)

    }
    
    @objc func savePressed()
    {
        let ref2 = Database.database().reference().childByAutoId().key! + songName
        let userDefaults = Foundation.UserDefaults.standard
        var value = userDefaults.stringArray(forKey: "SavedSongs") ?? [String]()
        //userDefaults.set(ref2, forKey: "Saved")
        if(value.count == 0)
        {
            userDefaults.set([ref2], forKey: "SavedSongs")
            saveSong(key: ref2)
        }else{
            value.append(ref2)
            userDefaults.set(value, forKey: "SavedSongs")
            saveSong(key: ref2)
        }
    }
    
    func saveSong(key: String)
    {
        let userDefaults = Foundation.UserDefaults.standard
        var arr = [String]()
        arr.append(fullSong.e)
        arr.append(fullSong.a)
        arr.append(fullSong.d)
        arr.append(fullSong.g)
        arr.append(fullSong.b)
        arr.append(fullSong.ee)
        var songWithoutQuotes = songName
        songWithoutQuotes.removeFirst()
        songWithoutQuotes.removeLast()
        arr.append(songWithoutQuotes)
        arr.append(artistName)
        arr.append(difficulty)
        arr.append(theDescription)
        userDefaults.set(arr, forKey: key)
        
//        let animation = CATransition()
//        animation.type = .fade
//        animation.subtype = .fromBottom
//        animation.duration = 0.4
//        self.view.window!.layer.add(animation, forKey: nil)
        let controller = SavedVC()
        self.present(controller, animated: true, completion: nil)
    }
    
    
    @objc func playPressed()
    {
        if(playing == false)
        {
        scheduledTimerWithTimeInterval()
        playButton.setImage(#imageLiteral(resourceName: "icons8-pause-button-50 (1)"), for: .normal)
            playing = true
        }else{
            playButton.setImage(#imageLiteral(resourceName: "icons8-play-50"), for: .normal)
            playing = false
        }
        
    }
    @objc func slowDown()
    {
        if(speedMultiplier - 0.25 > 0)
        {
            speedMultiplier = speedMultiplier - 0.25
        }
    }
    @objc func loopPressed()
    {
        if(loop == false)
        {
            loopButton.setImage(loopButton.currentImage?.mask(with: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), for: .normal)
            loop = true
        }else{
            loopButton.setImage(#imageLiteral(resourceName: "icons8-repeat-50 (1)"), for: .normal)
            loop = false
        }
    }
    @objc func speedUP()
    {
        if(speedMultiplier + 0.25 < 5)
        {
            speedMultiplier = speedMultiplier + 0.25
        }
    }
    
    @objc func resetPressed()
    {
        speedMultiplier = 1
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "drawBack" with the interval of 1 seconds
        var timer = Timer()
        self.timerLine.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.8)
        timer = Timer.scheduledTimer(withTimeInterval: 0.009, repeats: true, block: {_ in
            if(self.playing)
            {
                self.drawTimer()
            }else
            {
                self.timerLine.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.2)
                timer.invalidate()
                return
            }
            if(self.currentTab.row>=self.tableView.numberOfRows(inSection: 0)){
                if(self.loop == false)
                {
                    self.playing = false
                    self.playButton.setImage(#imageLiteral(resourceName: "icons8-play-50"), for: .normal)
                    self.timerLine.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.2)
                    timer.invalidate()
                }
                
                
                self.currentTab = IndexPath(row: 0, section: 0)
                self.timerLine.removeFromSuperview()
                
                self.timerLine.frame = CGRect(x: 10, y: 30, width: 0, height: 145)
                self.tableView.addSubview(self.timerLine)
                self.tableView.scrollToRow(at: self.currentTab, at: .top, animated: true)
                return
            }
            
        })
    }
    
    @objc func drawTimer()
    {
        timerLine.removeFromSuperview()
        if(timerLine.frame.minX <= self.view.bounds.width - 20)
        {
        timerLine.frame = CGRect(x: timerLine.frame.minX + speedMultiplier, y: timerLine.frame.minY, width: 5, height: 145)
        }else{
            timerLine.frame = CGRect(x: 10, y: timerLine.frame.minY + 170, width: 5, height: 145)
            currentTab = IndexPath(row: currentTab.row + 1, section: 0)
            if(currentTab.row < tableView.numberOfRows(inSection: 0))
            {
                tableView.scrollToRow(at: currentTab, at: .top, animated: true)
            }
            
        }
        tableView.addSubview(timerLine)
        
    }
    
    @objc func backPressed()
    {
//        let animation = CATransition()
//        animation.type = .fade
//        animation.duration = 0.3
//        animation.subtype = .fromLeft
//        self.view.window!.layer.add(animation, forKey: nil)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentTab = indexPath
    }
    @objc func singleTapAction(_ sender: UITapGestureRecognizer)
    {
        let tapLoc = sender.location(in: self.tableView)
        if let index  = self.tableView.indexPathForRow(at: tapLoc)
        {
            self.currentTab = index
            timerLine.removeFromSuperview()
            timerLine.frame = CGRect(x: tapLoc.x, y: (CGFloat(currentTab.row) * 170.0) + 35.0 , width: 5.0, height: 145.0)
            tableView.addSubview(timerLine)
        }
        else
        {
            return
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getAmountOfLines()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell") as! songTableViewCell
        if(indexPath.row<theSong.count)
        {
            
            cell.e.text = theSong[indexPath.row].e
            cell.a.text = theSong[indexPath.row].a
            cell.d.text = theSong[indexPath.row].d
            cell.g.text = theSong[indexPath.row].g
            cell.b.text = theSong[indexPath.row].b
            cell.ee.text = theSong[indexPath.row].ee
            cell.selectionStyle = .none
            
        }
        cell.backgroundColor = .clear
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
        return Int(((self.view.bounds.width / 20) / 2) + 1)
        
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
        return "   "
    }
    
    
    func createTempSong()
    {
        fullSong.theE = fullSong.e.components(separatedBy: "-")
        fullSong.theA = fullSong.a.components(separatedBy: "-")
        fullSong.theD = fullSong.d.components(separatedBy: "-")
        fullSong.theG = fullSong.g.components(separatedBy: "-")
        fullSong.theB = fullSong.b.components(separatedBy: "-")
        fullSong.theEE = fullSong.ee.components(separatedBy: "-")
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
        seperateIntoArray()
    }
    
    func seperateIntoArray()
    {
        let numLines = getAmountOfLines()
        let numNotes = getNotesPerLine()
        
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
    
    func uploadToDB()
    {
        let ref2 = Database.database().reference().childByAutoId().key! + songName
        let ref = Database.database().reference().child("Songs").child(ref2)
        ref.child("e").setValue(self.fullSong.e)
        ref.child("a").setValue(self.fullSong.a)
        ref.child("d").setValue(self.fullSong.d)
        ref.child("g").setValue(self.fullSong.g)
        ref.child("b").setValue(self.fullSong.b)
        ref.child("ee").setValue(self.fullSong.ee)
        
        ref.child("theUid").setValue(ref2)
        ref.child("theSongName").setValue(songName)
        ref.child("theArtist").setValue(artistName)
        ref.child("theDifficulty").setValue(difficulty)
        ref.child("theDescription").setValue(theDescription)
    }
    
    func addSpacing()
    {
        //let spacing = spacingBetweenNotes()
        var spacing2 = spacingBetweenNotes()
        spacing2.removeLast()
        spacing2.removeLast()
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
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .allButUpsideDown

        }
   }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.playing = false
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view = UIView()
        self.view.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        self.tableView = UITableView()
          theSong = []
        if UIDevice.current.orientation.isLandscape {
            landScape = true
        }else{
            landScape = false
        }
        self.viewDidLoad()
        
    }
}
