//
//  WorkoutManager.swift
//  Watch-Test WatchKit Extension
//
//  Created by Kaleb Wijaya on 27/06/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import Foundation
import HealthKit

/**
 `WorkoutManagerDelegate` exists to inform delegates of swing data changes.
 These updates can be used to populate the user interface.
 */
protocol WorkoutManagerDelegate: class {
    func didUpdateMotion(_ manager: WorkoutManager, gravityStr: String, rotationRateStr: String, userAccelStr: String, attitudeStr: String)
    
}

class WorkoutManager: MotionManagerDelegate {
    // MARK: Properties
    let motionManager = MotionManager()
    
    weak var delegate: WorkoutManagerDelegate?
    var session: HKWorkoutSession?
    
    // MARK: Initialization
    
    init() {
        motionManager.delegate = self
    }
    
    // MARK: WorkoutManager
    
    func startWorkout() {
        // If we have already started the workout, then do nothing.
        if (session != nil) {
            return
        }
        
        // Configure the workout session.
        session = HKWorkoutSession.init(activityType: .bowling, locationType: .indoor)
        
        // Start the workout session and device motion updates.
        session?.startActivity(with: nil)
        motionManager.startUpdates()
    }
    
    func stopWorkout() {
        // If we have already stopped the workout, then do nothing.
        if (session == nil) {
            return
        }
        
        // Stop the device motion updates and workout session.
        motionManager.stopUpdates()
        session?.end()
        
        // Clear the workout session.
        session = nil
    }
    
    // MARK: MotionManagerDelegate
    
    func didUpdateMotion(_ manager: MotionManager, gravityStr: String, rotationRateStr: String, userAccelStr: String, attitudeStr: String) {
        delegate?.didUpdateMotion(self, gravityStr: gravityStr, rotationRateStr: rotationRateStr, userAccelStr: userAccelStr, attitudeStr: attitudeStr)
    }
}
