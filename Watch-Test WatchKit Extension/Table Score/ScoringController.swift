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

class ScoringController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    @IBOutlet weak var scoreTable: WKInterfaceTable!
    
    var score = ["STR","9","8","7","6","5","4","3","2","1","0"]
    
    var wcSession:WCSession!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        loadTableData()
    }
    
    override func didDeactivate() {
        super.willActivate()
    }

    override func willActivate() {
        super.didDeactivate()
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
    }
    
    func loadTableData(){
        scoreTable.setNumberOfRows(score.count, withRowType: "RowController")
        
        for(index, rowModel) in score.enumerated(){
            if let rowController = scoreTable.rowController(at: index) as? RowController {
                rowController.scoreLabel.setText(rowModel)
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let message = ["flag":"0"]
        wcSession.sendMessage(message, replyHandler: nil, errorHandler: {
            Error in print(Error.localizedDescription)
        })
        WKInterfaceController.reloadRootControllers(
            withNames: ["MotionDetector"], contexts: []
        )
    }
    
}
