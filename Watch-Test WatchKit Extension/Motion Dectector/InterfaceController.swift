//
//  InterfaceController.swift
//  Watch-Test WatchKit Extension
//
//  Created by Kaleb Wijaya on 27/06/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import WatchKit
import Foundation
import Dispatch
import WatchConnectivity

class InterfaceController: WKInterfaceController, WorkoutManagerDelegate, WCSessionDelegate {

    let workoutManager = WorkoutManager()
    var active = false
    var wcSession:WCSession!
    
    var status = "Tracking..."
    var gravityStr = ""
    var attitudeStr = ""
    var userAccelStr = ""
    var rotationRateStr = ""
    
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    @IBOutlet weak var gravityLabel: WKInterfaceLabel!
    @IBOutlet weak var userAccel: WKInterfaceLabel!
    @IBOutlet weak var rotationLabel: WKInterfaceLabel!
    @IBOutlet weak var attitudeLabel: WKInterfaceLabel!
    
    override init() {
        super.init()
        workoutManager.delegate = self as WorkoutManagerDelegate
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // Configure interface objects he
        active = true
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        active = true
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        active = true
    }
    
    func didUpdateMotion(_ manager: WorkoutManager, gravityStr: String, rotationRateStr: String, userAccelStr: String, attitudeStr: String) {
        DispatchQueue.main.async {
            self.gravityStr = gravityStr
            self.userAccelStr = userAccelStr
            self.rotationRateStr = rotationRateStr
            self.attitudeStr = attitudeStr
            self.updateLabels();
        }
    }
    
    func updateLabels() {
        if active {
            gravityLabel.setText(gravityStr)
            userAccel.setText(userAccelStr)
            rotationLabel.setText(rotationRateStr)
            attitudeLabel.setText(attitudeStr)
        }
        let message = ["status":status , "gravity": gravityStr, "acceleration": userAccelStr, "rotation": rotationRateStr, "attitude": attitudeStr]
        wcSession.sendMessage(message, replyHandler: nil, errorHandler: {
            Error in print(Error.localizedDescription)
        })
    }
    
    @IBAction func stop() {
        titleLabel.setText(status)
        workoutManager.stopWorkout()
        updateLabels()
    }
    
    @IBAction func start() {
        titleLabel.setText(status)
        workoutManager.startWorkout()
        updateLabels()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
}
