//
//  FeedbackController.swift
//  Watch-Test WatchKit Extension
//
//  Created by Kaleb Wijaya on 18/07/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class FeedbackController:WKInterfaceController, WCSessionDelegate{
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    var wcSession:WCSession!
    var condition = "STR"
    let tips:[String] = ["Tilt Your Hand a Little To The Right", "Tilt Your Hand Slightly To The Right", "Good Handling, Keep It Up!"]
    var number = 0
    
    override func awake(withContext context: Any?) {
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        number = Int.random(in: 0 ..< tips.count)
        let message = ["tips":tips[number], "flag":"1"]
        wcSession.sendMessage(message, replyHandler: nil, errorHandler: {
            Error in print(Error.localizedDescription)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            self.animate(withDuration: 2) {
                WKInterfaceController.reloadRootControllers(
                    withNames: ["ScoringController"], contexts: []
                )
            }
        })
        super.awake(withContext: context)
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override func willActivate() {
        super.willActivate()
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
    }
}
