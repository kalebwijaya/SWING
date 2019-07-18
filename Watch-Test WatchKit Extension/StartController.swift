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

class StartController: WKInterfaceController {
    
    
    @IBAction func StartBowling() {
        WKInterfaceController.reloadRootControllers(
            withNames: ["MotionDetector"], contexts: []
        )
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func didDeactivate() {
        super.willActivate()
    }
    
    override func willActivate() {
        super.didDeactivate()
    }
}
