//
//  FirebaseManagementViewController.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 12/2/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FirebaseManagementViewController: UIViewController {
    
    var store = DataStore.sharedInstance
    
    var pullFirButton = UIButton()
    var pullFirLabel = UILabel()
    
    var fixMarkButton = UIButton()
    var fixMarkLabel = UILabel()
    
    var firPushButton = UIButton()
    var firPushLabel = UILabel()
    
    var backButton = UIButton()
    var backLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initalizeViews()
        constrainViews()
        colorizeViews()
        customizeViews()
    }
    
    func initalizeViews() {
        
        self.view.addSubviews(pullFirButton, fixMarkButton, firPushButton, backButton)
        
        pullFirButton.addSubview(pullFirLabel)
        fixMarkButton.addSubview(fixMarkLabel)
        firPushButton.addSubview(firPushLabel)
        backButton.addSubview(backLabel)
        
    }
    
    func constrainViews() {
        pullFirButton.translatesAutoresizingMaskIntoConstraints = false
        pullFirLabel.translatesAutoresizingMaskIntoConstraints = false
        
        fixMarkButton.translatesAutoresizingMaskIntoConstraints = false
        fixMarkLabel.translatesAutoresizingMaskIntoConstraints = false
        
        firPushButton.translatesAutoresizingMaskIntoConstraints = false
        firPushLabel.translatesAutoresizingMaskIntoConstraints = false
        
        pullFirButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.15).isActive = true
        pullFirButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.1).isActive = true
        pullFirButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: self.view.frame.width * -0.1).isActive = true
        pullFirButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        pullFirLabel.constrainTo(pullFirButton)
        
        fixMarkButton.topAnchor.constraint(equalTo: pullFirButton.bottomAnchor, constant: self.view.frame.height * 0.05).isActive = true
        fixMarkButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.1).isActive = true
        fixMarkButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: self.view.frame.width * -0.1).isActive = true
        fixMarkButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        fixMarkLabel.constrainTo(fixMarkButton)
        
        firPushButton.topAnchor.constraint(equalTo: fixMarkButton.bottomAnchor, constant: self.view.frame.height * 0.05).isActive = true
        firPushButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.self.view.frame.width * 0.1).isActive = true
        firPushButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: self.view.frame.width * -0.1).isActive = true
        firPushButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.2).isActive = true
        
        firPushLabel.constrainTo(firPushButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height * 0.05).isActive = true
        backButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: self.view.frame.width * 0.05).isActive = true
        backButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.2).isActive = true
        backButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        backLabel.constrainTo(backButton)
    }
    
    func colorizeViews() {
        self.view.backgroundColor = UIColor.themePurple
        pullFirButton.backgroundColor = UIColor.themeOrange
        pullFirLabel.textColor = UIColor.black
        fixMarkButton.backgroundColor = UIColor.themeOrange
        fixMarkLabel.textColor = UIColor.black
        firPushButton.backgroundColor = UIColor.themeOrange
        firPushLabel.textColor = UIColor.black
        backButton.backgroundColor = UIColor.themeBlue
    }
    
    func customizeViews() {
        pullFirButton.layer.cornerRadius = 15
        pullFirButton.addTarget(self, action: #selector(tappullFirButton), for: .touchUpInside)
        
        pullFirLabel.text = "Step 1: Pull landmarks from Firebase (WARNING: Will clear local landmark data)"
        pullFirLabel.numberOfLines = 3
        pullFirLabel.textAlignment = .center
        pullFirLabel.font = UIFont(name: "Avenir", size: 20)
        
        fixMarkButton.layer.cornerRadius = 15
        fixMarkButton.addTarget(self, action: #selector(tapFixMarkButton), for: .touchUpInside)
        
        fixMarkLabel.text = "Step 2: View list of landmarks and manually edit"
        fixMarkLabel.numberOfLines = 3
        fixMarkLabel.textAlignment = .center
        fixMarkLabel.font = UIFont(name: "Avenir", size: 20)
        
        firPushButton.layer.cornerRadius = 15
        firPushButton.addTarget(self, action: #selector(tapFirPushButton), for: .touchUpInside)
        
        firPushLabel.text = "Step 3: Push the data back to Firebase (WARNING: Will clear previous landmark data from database)"
        firPushLabel.numberOfLines = 3
        firPushLabel.textAlignment = .center
        firPushLabel.font = UIFont(name: "Avenir", size: 20)
        
        backButton.layer.cornerRadius = 10
        backButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        backLabel.text = "Back"
        backLabel.font = UIFont.init(name: "Avenir", size: 20)
        backLabel.textAlignment = .center
    }
    
    
    
    func tappullFirButton() {
        store.landmarks.removeAll()
        FirebaseAPI.pullAllLocations()
    }
    
    func tapFixMarkButton() {
        let dest = LandmarkListViewController()
        
        present(dest, animated: true)
        
    }
    func tapFirPushButton() {
        FirebaseAPI.serializeAndStoreDataOnFirebase()
        
    }
    func tapBackButton() {
        dismiss(animated: true)
    }
    

}
