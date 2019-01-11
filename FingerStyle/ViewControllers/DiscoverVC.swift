//
//  SavedVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import UIKit
import Firebase

class DiscoverVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate, UIScrollViewDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate, UISearchBarDelegate{
    
    var tableView = UITableView()
    let theTabBar = TabBarVC()
    var songs = [SongObj]()
    var searchBar =  UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        searchBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        searchBar.returnKeyType = .done
        loadTempSongs()
        loadSongs()
        TabBarVC.currentSelected = "Discover"
        self.view.backgroundColor = .white
        print("Saved VC")
        tableView.register(savedCellTableViewCell.self, forCellReuseIdentifier: "savedCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: self.view.bounds.width * 0.2, y: 160, width: self.view.bounds.width - self.view.bounds.width * 0.2, height: self.view.bounds.height-160)
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
        label.text = "Discover Songs"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont(name: "AvenirNextCondensed-HeavyItalic", size: 35.0)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        
        navView.addSubview(label)
        searchBar.frame = CGRect(x: 0, y: navView.frame.maxY, width: view.bounds.width, height: 40)
        navView.addSubview(searchBar)
        
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
            self.tableView.frame = CGRect(x: self.view.bounds.width * 0.2, y: 160, width: self.view.bounds.width - self.view.bounds.width * 0.2, height: self.view.bounds.height-160)
        })
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    @objc func swipeLeft(_ sender: UISwipeGestureRecognizer)
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.tableView.frame = CGRect(x: 0, y: 160, width: self.view.bounds.width, height: self.view.bounds.height-160)
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
        
        let ref = Database.database().reference().child("Songs")
        let thesongs = (userDefaults.stringArray(forKey: "Saved") ?? [String]())
        print(thesongs)
        //for i in thesongs{
        //ref.child(i)
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() {
                print("WELL FUCK")
                return }
            let test = snapshot.value as! [String : AnyObject]
            //print(test)
            for(_, value) in test
            {
                print(value)
                let theValue = value as! [String : String]
                let song = SongObj()
                song.nameOfArtist = theValue["theArtist"]
                song.nameOfSong = theValue["theSongName"]
                song.difficulty = theValue["theDifficulty"]
                song.uid = theValue["theUid"]
                
                song.songTab.e = theValue["e"]
                song.songTab.a = theValue["a"]
                song.songTab.d = theValue["d"]
                song.songTab.g = theValue["g"]
                song.songTab.b = theValue["b"]
                song.songTab.ee = theValue["ee"]
                
                self.songs.append(song)
            }
            self.tableView.reloadData()
        })
        
        //}
    }
    
}
