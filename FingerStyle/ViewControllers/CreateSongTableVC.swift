//
//  CreateSongTableVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/12/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//


import UIKit
import Firebase

class CreateSongTableVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate{
    
    
    var tableView = UITableView()
    var theSong = [SongTabObj]()
    var fullSong = SongTabObj()
    var size = CGRect()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("THIS IS WHAT WE BE OOKING FOR", fullSong.theE)
        self.view.backgroundColor = .white
        self.view.frame = size
        tableView.register(createSongTableViewCell.self, forCellReuseIdentifier: "createsongCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        tableView.allowsSelection = false
        
        
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getAmountOfLines()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "createsongCell") as! createSongTableViewCell
        
        if(indexPath.row<theSong.count)
        {
            let theSize = theSong.count - 1
            cell.e.text = theSong[theSize - indexPath.row].e
            cell.a.text = theSong[theSize - indexPath.row].a
            cell.d.text = theSong[theSize - indexPath.row].d
            cell.g.text = theSong[theSize - indexPath.row].g
            cell.b.text = theSong[theSize - indexPath.row].b
            cell.ee.text = theSong[theSize - indexPath.row].ee
            
            
        }
        
        return cell
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
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
    
    func spacingBetweenNotes()->String
    {
        return "   "
    }
    
    
    func createTempSong()
    {
        fullSong.theE = []
        fullSong.theA = []
        fullSong.theD = []
        fullSong.theG = []
        fullSong.theB = []
        fullSong.theEE = []
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
    
    
    
}

