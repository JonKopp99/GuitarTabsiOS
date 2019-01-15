//
//  HowToVC.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/13/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//

import Foundation
import UIKit

class HowToVC: UIViewController, UITextViewDelegate {
    
    var navView = UIView()
    var desctextView = UITextView()
    var wv = UIWebView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = .white
        navView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: self.view.bounds.height * 0.1))
        navView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        navView.isOpaque = true
        
        let label = UILabel(frame: CGRect(x:0, y: navView.bounds.height/2-10, width: navView.bounds.width, height: 50))
        label.text = "How to use"
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
        
        wv.frame = CGRect(x: 10, y: navView.frame.maxY + 10, width: self.view.bounds.width - 20, height: 200)
        loadYoutube(videoID: "v1jOJ5fWmYE")
        self.view.addSubview(wv)
    }
    func loadYoutube(videoID:String) {
        // create a custom youtubeURL with the video ID
        guard
            let youtubeURL = NSURL(string: "https://www.youtube.com/embed/\(videoID)")
            else { return }
        // load your web request
        wv.loadRequest(NSURLRequest(url: youtubeURL as URL) as URLRequest)
    }
    @objc func backPressed()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
            
        }
    }
}
