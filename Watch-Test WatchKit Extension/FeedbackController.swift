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
    let tips = "Tilt Your Hand a Little To The Right"
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        let message = ["tips":tips, "flag":"1"]
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
