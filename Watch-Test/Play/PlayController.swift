//
//  PlayController.swift
//  Watch-Test
//
//  Created by Kaleb Wijaya on 18/07/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import UIKit
import WatchConnectivity

class PlayController: UIViewController, WCSessionDelegate {

    var wcSession:WCSession!
    
    
    @IBOutlet weak var loading: UIImageView!
    
    @IBOutlet weak var tipsLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.1960784314, alpha: 1)
        wcSession = WCSession.default
        wcSession.delegate = self
        wcSession.activate()
        loading.loadGif(name: "loading")
        // Do any additional setup after loading the view.
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            if(message["flag"]as?String == "0"){
                self.tipsLabel.isHidden = true
                self.loading.isHidden = false
            }else{
                self.loading.isHidden = true
                self.tipsLabel.isHidden = false
                self.tipsLabel.text = message["tips"] as? String
            }
        }
        
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
