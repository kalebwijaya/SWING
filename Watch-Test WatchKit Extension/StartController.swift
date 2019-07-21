//
//  ScoringController.swift
//  Watch-Test
//
//  Created by Kaleb Wijaya on 17/07/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import WatchKit
import WatchConnectivity
import UIKit

class StartController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    var wcSession:WCSession!
    
    @IBAction func StartBowling() {
        let message = ["flag":"0"]
        wcSession.sendMessage(message, replyHandler: nil, errorHandler: {
            Error in print(Error.localizedDescription)
        })
        WKInterfaceController.reloadRootControllers(
            withNames: ["MotionDetector"], contexts: []
        )
    }
    
    override func awake(withContext context: Any?) {
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        super.awake(withContext: context)
    }
    
    override func didDeactivate() {
        super.willActivate()
    }
    
    override func willActivate() {
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        super.didDeactivate()
    }
}
