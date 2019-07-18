//
//  User.swift
//  MC2 User Profile
//
//  Created by Thomas Pratama Putra on 16/07/19.
//  Copyright © 2019 thomaspputra. All rights reserved.
//


import UIKit

class User {
    var userProfileImage: UIImage
    var userFullName: String
    var userBowlerStatus: String
    var userBallWeight: Double
    var userGender: String
    var userWeight: Int
    var userHeight: Int
    
    init(userProfileImage: UIImage, userFullName: String, userBowlerStatus: String, userGender: String, userWeight: Int, userHeight: Int) {
        self.userProfileImage = userProfileImage
        self.userFullName = userFullName
        self.userBowlerStatus = userBowlerStatus
        self.userBallWeight = 0.0
        self.userGender = userGender
        self.userWeight = userWeight
        self.userHeight = userHeight
    }
    
    func ballWeight() -> Double {
        var weightResult: Double!
        if userGender.caseInsensitiveCompare("Male") == .orderedSame {
            weightResult = (Double(userWeight) * 2.205) * 0.1
        } else {
            weightResult = ((Double(userWeight) * 2.205) * 0.1) - 2
        }
        
        if weightResult < 11.0 {
            weightResult = 11.0
        } else if weightResult > 16.0 {
            weightResult = 16.0 as Double
        }
        return weightResult
    }
}
