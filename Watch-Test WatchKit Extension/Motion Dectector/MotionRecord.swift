//
//  MotionRecord.swift
//  Watch-Test WatchKit Extension
//
//  Created by Kaleb Wijaya on 17/07/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import WatchKit
import WatchConnectivity
import UIKit

class MotionRecord: WKInterfaceController {
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            self.animate(withDuration: 2) {
                WKInterfaceController.reloadRootControllers(
                    withNames: ["FeedbackController"], contexts: []
                )
            }
        })
        
       
    }
    
    override func didDeactivate() {
        super.willActivate()
    }
    
    override func willActivate() {
        super.didDeactivate()
    }

}
