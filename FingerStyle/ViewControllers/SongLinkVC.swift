//
//  SongLinkVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 4/16/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import WebKit

class SongLinkVC:UIViewController, UIScrollViewDelegate{
    var songName = String()
    var artistName = String()
    var difficulty = String()
    var theUid = String()
    var theLink = String()
    var landScape = Bool()
    var navView = UIView()
    var infobutton = UIButton()
    var theDescription = String()
    var infoView = UIView()
    var discover = Bool()
    var admin = Bool()
    
    var webView = UIScrollView()
    var webSiteView = WKWebView()
    var isImage = true
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height * 0.1))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let label = UILabel(frame: CGRect(x:30, y: navView.bounds.height / 2 - 10, width: navView.bounds.width - 60, height: 50))
        if(landScape)
        {
            label.frame = CGRect(x:25, y: navView.bounds.height / 2 - 25, width: navView.bounds.width - 50, height: 50)
        }
        
        self.view.backgroundColor = .white
        
        
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
        
        webView.frame = CGRect(x: 0, y: navView.frame.maxY, width: self.view.bounds.width, height: self.view.bounds.height - (navView.frame.height))
        
        self.view.addSubview(webView)
        if(self.isImage == false)
        {
            loadTab()
            webSiteView.frame = webView.frame
            self.webView.addSubview(webSiteView)
        }else{
            webView.delegate = self
            webView.minimumZoomScale = 1.0
            webView.maximumZoomScale = 6.0
            loadImage()
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
    func loadTab()
    {
        let url = NSURL(string: theLink)
        let request = NSURLRequest(url: url! as URL)
        webSiteView.load(request as URLRequest)
        
    }
    
    func loadImage()
    {
        imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - (navView.frame.height))
        imageView.downloaded(from: theLink)
        imageView.contentMode = .scaleAspectFit
        //imageView.frame.origin.y = -self.view.bounds.height * 0.1
        self.webView.addSubview(imageView)
        
    }
    
    @objc func swipeUp()
    {
        UIView.animate(withDuration: 0.4, animations: {
            self.navView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.1)
            self.webView.frame = CGRect(x: 0, y: self.navView.frame.maxY, width: self.view.bounds.width, height: self.view.bounds.height - (self.navView.frame.height))
        }, completion: { (finished: Bool) in
            self.infobutton.addTarget(self, action:#selector(self.swipeDown), for: .touchUpInside)
            self.infoView.removeFromSuperview()
        })
    }
    
    @objc func swipeDown()
    {
        UIView.animate(withDuration: 0.4, animations: {
            self.navView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height * 0.2)
            self.webView.frame = CGRect(x: 0, y: (self.view.bounds.height * 0.2), width: self.view.bounds.width, height: self.view.bounds.height - (self.view.bounds.height * 0.2 + 50))
            
        }, completion: { (finished: Bool) in
            self.infobutton.addTarget(self, action:#selector(self.swipeUp), for: .touchUpInside)
            self.infoPressed()
        })
        
    }
    
    @objc func backPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func infoPressed()
    {
        infoView.removeFromSuperview()
        infoView.frame = CGRect(x: 25, y: self.view.bounds.height * 0.1, width: self.view.bounds.width - 50, height: self.view.bounds.height * 0.1)
        infoView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).withAlphaComponent(0.2)
        infoView.layer.cornerRadius = 15
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
    
    
    @objc func deletePressed()
    {
        let userDefaults = Foundation.UserDefaults.standard
        var value = userDefaults.stringArray(forKey: "SavedLinks") ?? [String]()
        var ctr = 0
        for i in value
        {
            if(i == theUid)
            {
                userDefaults.set([], forKey: i)
                value.remove(at: ctr)
                userDefaults.set(value, forKey: "SavedLinks")
            }
            ctr += 1
        }
        let controller = SavedVC()
        self.present(controller, animated: false, completion: nil)
        //uploadToDB()
    }
    
    @objc func saveAdminPressed()
    {
        let ref2 = Database.database().reference().childByAutoId().key! + songName
        let ref = Database.database().reference().child("PublishedSongs").child(ref2)
        
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
        var value = userDefaults.stringArray(forKey: "SavedLinks") ?? [String]()
        //userDefaults.set(ref2, forKey: "Saved")
        if(value.count == 0)
        {
            userDefaults.set([ref2], forKey: "SavedLinks")
            saveSong(key: ref2)
        }else{
            value.append(ref2)
            userDefaults.set(value, forKey: "SavedLinks")
            saveSong(key: ref2)
        }
    }
    
    func saveSong(key: String)
    {
        let userDefaults = Foundation.UserDefaults.standard
        var arr = [String]()
        var songWithoutQuotes = songName
        songWithoutQuotes.removeFirst()
        songWithoutQuotes.removeLast()
        arr.append(songWithoutQuotes)
        arr.append(artistName)
        arr.append(difficulty)
        arr.append(theLink)
        arr.append(theDescription)
        userDefaults.set(arr, forKey: key)
        
        let controller = SavedVC()
        self.present(controller, animated: false, completion: nil)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.view = UIView()
        self.view.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        self.imageView = UIImageView() 
        if UIDevice.current.orientation.isLandscape {
            landScape = true
        }else{
            landScape = false
        }
        self.viewDidLoad()
        
    }
}
