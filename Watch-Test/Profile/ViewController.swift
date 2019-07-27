//
//  ViewController.swift
//  MC2 User Profile
//
//  Created by Thomas Pratama Putra on 09/07/19.
//  Copyright © 2019 thomaspputra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var userPhotoProfileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userBowlerStatusLabel: UILabel!
    
    @IBOutlet weak var userBowlingBallWeightLabel: UILabel!
    @IBOutlet weak var userWeightLabel: UILabel!
    @IBOutlet weak var userHeightLabel: UILabel!
    
    @IBOutlet weak var userBowlingBallWeightView: UIView!
    @IBOutlet weak var userWeightView: UIView!
    @IBOutlet weak var userHeightView: UIView!
    
    @IBOutlet weak var wViewLabel: UILabel!
    @IBOutlet weak var hViewLabel: UILabel!
    
    @IBOutlet weak var editProfileBttn: UIBarButtonItem!
    
    @IBOutlet weak var bowlingBallIV: UIImageView!
    
    @IBOutlet weak var ballRec: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelView(userClass: loadUserDefaults())
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupLabelView(userClass: loadUserDefaults())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.layoutIfNeeded()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
    }
    
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.1960784314, alpha: 1)
        
        userPhotoProfileImageView.layer.borderWidth = 1
        userPhotoProfileImageView.layer.masksToBounds = false
        userPhotoProfileImageView.layer.borderColor = UIColor.black.cgColor
        userPhotoProfileImageView.layer.cornerRadius = userPhotoProfileImageView.frame.height / 2
        userPhotoProfileImageView.layer.borderColor = UIColor.clear.cgColor
        userPhotoProfileImageView.clipsToBounds = true
        
        userBowlingBallWeightView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        userWeightView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        userHeightView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        
        userNameLabel.textColor = .white
        userBowlerStatusLabel.textColor = .lightGray
        
        userBowlingBallWeightLabel.textColor = .white
        userWeightLabel.textColor = .white
        userHeightLabel.textColor = .white
        
        wViewLabel.textColor = .white
        hViewLabel.textColor = .white
        
        bowlingBallIV.layer.borderColor = UIColor.clear.cgColor
        
        ballRec.textColor = .white
    }
    
    func setupLabelView(userClass: User) {
        userPhotoProfileImageView.image = userClass.userProfileImage
        userNameLabel.text = userClass.userFullName
        userBowlerStatusLabel.text = userClass.userBowlerStatus
        userBowlingBallWeightLabel.text = "\(Int(round(userClass.ballWeight()))) LB"
        userWeightLabel.text = "\(userClass.userWeight) KG"
        userHeightLabel.text = "\(userClass.userHeight) CM"
    }
    
    
    @IBAction func editProfileBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToEditProfile", sender: self)
    }
}

