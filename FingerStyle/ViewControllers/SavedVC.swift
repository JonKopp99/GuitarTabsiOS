//
//  SavedVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit

class SavedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate{
    
    var tableView = UITableView()
    let theTabBar = TabBarVC()
    var songs = [SongObj]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTempSongs()
        TabBarVC.currentSelected = "Saved"
        self.view.backgroundColor = .white
        print("Saved VC")
        tableView.register(savedCellTableViewCell.self, forCellReuseIdentifier: "savedCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: self.view.bounds.width * 0.2, y: 100, width: self.view.bounds.width - self.view.bounds.width * 0.2, height: self.view.bounds.height-100)
        tableView.separatorStyle = .none
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRight(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.tableView.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.tableView.addGestureRecognizer(swipeLeft)
        
        self.view.backgroundColor = .white
        self.theTabBar.view.backgroundColor = .white
        
        let navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 100))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let label = UILabel(frame: CGRect(x:0, y: navView.bounds.height/2-10, width: navView.bounds.width, height: 50))
       
        theTabBar.view.gestureRecognizers?.removeAll()
        label.text = "Saved Songs"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "AvenirNextCondensed-HeavyItalic", size: 35.0)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        navView.addSubview(label)
        self.theTabBar.view.addSubview(navView)
        
    
    }
    override func viewDidAppear(_ animated: Bool) {
        theTabBar.loadViewIfNeeded()
        self.addChild(theTabBar)

        self.view.addSubview(theTabBar.view)
        self.view.addSubview(tableView)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        print("Getting Called")
        if gestureRecognizer is UITapGestureRecognizer {
            let location = touch.location(in: tableView)
            return (tableView.indexPathForRow(at: location) == nil)
        }
        return true
    }
    
    @objc func swipeRight(_ sender: UISwipeGestureRecognizer)
    {
        print("Swiperight")
        //theTabBar.perform(#selector(theTabBar.swipeRight),with: nil, afterDelay: 0)
        UIView.animate(withDuration: 0.3, animations: {
            self.tableView.frame = CGRect(x: self.view.bounds.width * 0.2, y: 100, width: self.view.bounds.width - self.view.bounds.width * 0.2, height: self.view.bounds.height-100)
        })
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    @objc func swipeLeft(_ sender: UISwipeGestureRecognizer)
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.tableView.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height-100)
            })
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedCell") as! savedCellTableViewCell
        print(indexPath.row)
        print(("\"" + (songs[indexPath.row].nameOfSong) + "\""))
        cell.nameOfArtist.text = songs[indexPath.row].nameOfArtist
        cell.nameOfSong.text = ("\"" + (songs[indexPath.row].nameOfSong) + "\"")
        cell.difficulty.text = songs[indexPath.row].difficulty
        
        cell.nameOfArtist.sizeToFit()
        cell.nameOfSong.sizeToFit()
        cell.difficulty.sizeToFit()
        
        cell.nameOfArtist.adjustsFontSizeToFitWidth = true
        cell.nameOfSong.adjustsFontSizeToFitWidth = true
        cell.difficulty.adjustsFontSizeToFitWidth = true
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row at IndexPath: ", indexPath)
        let controller = SongVC()
        controller.songName = ("\"" + (songs[indexPath.row].nameOfSong) + "\"")
        controller.artistName = (songs[indexPath.row].nameOfArtist)
        controller.difficulty = (songs[indexPath.row].difficulty)
        self.present(controller, animated: false, completion: nil)
    }
    
    func loadTempSongs()
    {
        let s = SongObj()
        //0
        s.nameOfSong = "All Star"
        s.nameOfArtist = "Smash Mouth"
        s.difficulty = "Expert"
        songs.append(s)
        //1
        let s1 = SongObj()
        s1.nameOfSong = "Toxic"
        s1.nameOfArtist = "Britney Spears"
        s1.difficulty = "Expert"
        songs.append(s1)
        //2
        let s2 = SongObj()
        s2.nameOfSong = "Shewolf"
        s2.nameOfArtist = "Shakira"
        s2.difficulty = "Intermediate"
        songs.append(s2)
        //3
        let s3 = SongObj()
        s3.nameOfSong = "Pokemon Theme"
        s3.nameOfArtist = "Pokemon Company"
        s3.difficulty = "Beginner"
        songs.append(s3)
        //4
        let s4 = SongObj()
        s4.nameOfSong = "Goofey Goober Rock"
        s4.nameOfArtist = "Spongebob"
        s4.difficulty = "Expert"
        songs.append(s4)
        //5
        let s5 = SongObj()
        s5.nameOfSong = "Gary Come Home"
        s5.nameOfArtist = "Spongebob"
        s5.difficulty = "Expert"
        songs.append(s5)
        
        //6
        let s6 = SongObj()
        s6.nameOfSong = "Ripped My Pants"
        s6.nameOfArtist = "Spongebob"
        s6.difficulty = "Expert"
        songs.append(s6)
        //7
        let s7 = SongObj()
        s7.nameOfSong = "Random Song"
        s7.nameOfArtist = "Random Artist"
        s7.difficulty = "Intermediate"
        songs.append(s7)
        //8
        let s8 = SongObj()
        s8.nameOfSong = "SwoleJon's Biceps"
        s8.nameOfArtist = "Arnold"
        s8.difficulty = "Expert"
        songs.append(s8)
        //9
        let s9 = SongObj()
        s9.nameOfSong = "I Gave You All"
        s9.nameOfArtist = "Mumford and Sons"
        s9.difficulty = "Intermediate"
        songs.append(s9)
        tableView.reloadData()
    }
    
}
