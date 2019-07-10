//  ViewController.swift
//  FingerStyle
//
//  Created by Jonathan Kopp on 1/7/19.
//  Copyright © 2019 Jonathan Kopp. All rights reserved.
//
import UIKit

class TabBarVC: UIViewController, UINavigationControllerDelegate, UIGestureRecognizerDelegate{
    
    var tabBar = UIView()
    var tabBarWidth = CGFloat()
    var tabBarHeight = CGFloat()
    var tabBarY = CGFloat()
    var currentEndY = CGFloat()
    static var currentSelected = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add Swipe Gestures
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRight(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        //swipeRight.cancelsTouchesInView = false
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        //swipeLeft.cancelsTouchesInView = false
        //
        
        //Sets up the constraints for the bar
        tabBarWidth = self.view.bounds.width * 0.25
        tabBarHeight = self.view.bounds.height * 0.6
        tabBarY = self.view.bounds.height * 0.2
        currentEndY = tabBarWidth
        //Creates tabbar
        createTabBar()
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        //Checks what the current selected page is
        if(TabBarVC.currentSelected == "")
        {
            
            TabBarVC.currentSelected = "Discover"
            let controller = DiscoverVC()
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    //Creates the tab bar with 4 static buttons
    func createTabBar()
    {
        
        tabBar = UIView(frame: CGRect(x: -tabBarWidth, y: tabBarY, width: tabBarWidth, height: tabBarHeight))
        tabBar.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        tabBar.layer.cornerRadius = 20
        tabBar.alpha = 0
        
        let iconWidth = self.view.bounds.width * 0.2 - 10
        let iconHeight = tabBar.bounds.height / 4
        
        //Creates the button then sees if it is current selected button if it is then it gets masked in black.
        let discoverbutton = UIButton(frame: CGRect(x: self.view.bounds.width * 0.05, y: -10, width: iconWidth, height: iconHeight))
        discoverbutton.setImage(#imageLiteral(resourceName: "icons8-guitar-50"), for: .normal)
        discoverbutton.addTarget(self, action:#selector(self.discoverPressed), for: .touchUpInside)
        if(TabBarVC.currentSelected == "Discover")
        {
            discoverbutton.setImage(discoverbutton.currentImage?.mask(with: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), for: .normal)
        }
        tabBar.addSubview(discoverbutton)
        //
        
        //Adds the rest of the buttons
        let savedbutton = UIButton(frame: CGRect(x: self.view.bounds.width * 0.05, y: discoverbutton.frame.maxY + 10, width: iconWidth, height: iconHeight))
        savedbutton.setImage(#imageLiteral(resourceName: "icons8-music-notation-filled-50 (1)"), for: .normal)
        savedbutton.addTarget(self, action:#selector(self.savedPressed), for: .touchUpInside)
        if(TabBarVC.currentSelected == "Saved")
        {
            savedbutton.setImage(savedbutton.currentImage?.mask(with: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), for: .normal)
        }
        tabBar.addSubview(savedbutton)
        
        let addbutton = UIButton(frame: CGRect(x: self.view.bounds.width * 0.05, y: savedbutton.frame.maxY + 10, width: iconWidth, height: iconHeight))
        addbutton.setImage(#imageLiteral(resourceName: "icons8-plus-math-filled-50"), for: .normal)
        addbutton.addTarget(self, action:#selector(self.addPressed), for: .touchUpInside)
        if(TabBarVC.currentSelected == "Add")
        {
            addbutton.setImage(addbutton.currentImage?.mask(with: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), for: .normal)
        }
        tabBar.addSubview(addbutton)
        
        let settingsbutton = UIButton(frame: CGRect(x: self.view.bounds.width * 0.05, y: addbutton.frame.maxY + 8, width: iconWidth, height: iconHeight))
        settingsbutton.setImage(#imageLiteral(resourceName: "icons8-services-50"), for: .normal)
        settingsbutton.addTarget(self, action:#selector(self.settingsPressed), for: .touchUpInside)
        if(TabBarVC.currentSelected == "Settings")
        {
            settingsbutton.setImage(settingsbutton.currentImage?.mask(with: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), for: .normal)
        }
        tabBar.addSubview(settingsbutton)
        //
        
        self.view.addSubview(tabBar)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBar.frame = CGRect(x: -self.view.bounds.width * 0.05, y: self.tabBar.frame.minY, width: self.tabBarWidth, height: self.tabBarHeight)
            self.tabBar.alpha = 1
        })
        
        
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        get {
            return .portrait
            
        }
    }
    
    @objc func discoverPressed()
    {
        if(TabBarVC.currentSelected != "Discover")
        {
            fadeAnimate()
            TabBarVC.currentSelected = "Discover"
            let controller = DiscoverVC()
            self.present(controller, animated: false, completion: nil)
        }
    }
    @objc func savedPressed()
    {
        if(TabBarVC.currentSelected != "Saved")
        {
            let controller = SavedVC()
            fadeAnimate()
            self.present(controller, animated: false, completion: nil)
            TabBarVC.currentSelected = "Saved"
        }
    }
    @objc func addPressed()
    {
        if(TabBarVC.currentSelected != "Add")
        {
            fadeAnimate()
            let controller = CreateVC()
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    @objc func settingsPressed()
    {
        if(TabBarVC.currentSelected != "Settings")
        {
            fadeAnimate()
            let controller = SettingsVC()
            self.present(controller, animated: false, completion: nil)
        }
    }
    
    func fadeAnimate()
    {
        let animation = CATransition()
        animation.type = .fade
        animation.duration = 0.15
        animation.subtype = .fromLeft
        self.view.window!.layer.add(animation, forKey: nil)
    }
    @objc func swipeRight(_ sender: UISwipeGestureRecognizer)
    {
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBar.alpha = 1
            self.tabBar.frame = CGRect(x: -self.view.bounds.width * 0.05, y: self.tabBar.frame.minY, width: self.tabBarWidth, height: self.tabBarHeight)
            self.currentEndY = self.tabBarWidth
        })
    }
    
    @objc func swipeLeft(_ sender: UISwipeGestureRecognizer)
    {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBar.alpha = 0
            self.tabBar.frame = CGRect(x: -self.tabBar.frame.width, y: self.tabBar.frame.minY, width: self.tabBarWidth, height: self.tabBarHeight)
            self.currentEndY = 0.0
        })
    }
    
    func getTabBarWidth() ->CGFloat
    {
        return self.currentEndY
    }
    
}
