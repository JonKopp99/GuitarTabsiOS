//
//  SavedVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit
import Firebase

class SavedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate{
    
    var tableView = UITableView()
    let theTabBar = TabBarVC()
    var songs = [SongObj]()
    var navView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let userDefaults = Foundation.UserDefaults.standard
//        userDefaults.set([], forKey: "SavedSongs")
        TabBarVC.currentSelected = "Saved"
        navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height * 0.1))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let label = UILabel(frame: CGRect(x:0, y: navView.bounds.height/2-10, width: navView.bounds.width, height: 50))
        
        theTabBar.view.gestureRecognizers?.removeAll()
        label.text = "Saved Songs"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "AvenirNextCondensed-HeavyItalic", size: 30.0)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        navView.addSubview(label)
        self.theTabBar.view.addSubview(navView)
        
        
        
        loadTempSongs()
        loadSongs()
        
        self.view.backgroundColor = .white
        print("Saved VC")
        tableView.register(savedCellTableViewCell.self, forCellReuseIdentifier: "savedCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: self.view.bounds.width * 0.2, y: navView.bounds.maxY, width: self.view.bounds.width - self.view.bounds.width * 0.2, height: self.view.bounds.height - navView.bounds.maxY)
        tableView.separatorStyle = .none
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRight(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.tableView.addGestureRecognizer(swipeRight)

        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.tableView.addGestureRecognizer(swipeLeft)
        
        self.view.backgroundColor = .white
        self.theTabBar.view.backgroundColor = .white
        
        
        
    
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
            
        }
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
            self.tableView.frame = CGRect(x: self.view.bounds.width * 0.2, y: self.navView.bounds.maxY, width: self.view.bounds.width - self.view.bounds.width * 0.2, height: self.tableView.bounds.height)
        })
        
        if(tableView.cellForRow(at: (IndexPath(row: 0, section: 0))) != nil)
        {
            tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
        }
    }
    @objc func swipeLeft(_ sender: UISwipeGestureRecognizer)
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.tableView.frame = CGRect(x: 0, y: self.navView.bounds.maxY, width: self.view.bounds.width, height: self.tableView.bounds.height)
            })
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
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
        if(tableView.cellForRow(at: indexPath) != nil)
        {
            let controller = SongVC()
            controller.songName = ("\"" + (songs[indexPath.row].nameOfSong) + "\"")
            controller.artistName = (songs[indexPath.row].nameOfArtist)
            controller.difficulty = (songs[indexPath.row].difficulty)
            controller.theUid = (songs[indexPath.row].uid)
            controller.fullSong = (songs[indexPath.row].songTab)
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    func loadTempSongs()
    {
        
    }
    
    func loadSongs()
    {
        print("LoadSongsCalled")
        let userDefaults = Foundation.UserDefaults.standard
        
        let thesongs = (userDefaults.stringArray(forKey: "SavedSongs") ?? [String]())
        print(thesongs)
        if(thesongs.count>=1)
        {
            for i in thesongs{
                let song = SongObj()
                let songInfo = (userDefaults.stringArray(forKey: i) ?? [String]())
                print(songInfo)
                song.songTab.e = songInfo[0]
                song.songTab.a = songInfo[1]
                song.songTab.d = songInfo[2]
                song.songTab.g = songInfo[3]
                song.songTab.b = songInfo[4]
                song.songTab.ee = songInfo[5]
                song.nameOfSong = songInfo[6]
                song.nameOfArtist = songInfo[7]
                song.difficulty = songInfo[8]
                song.uid = i
                songs.append(song)
                
            }
        }
        
    }
    
}
