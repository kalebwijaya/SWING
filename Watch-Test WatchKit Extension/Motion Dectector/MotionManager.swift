//
//  MotionManager.swift
//  Watch-Test WatchKit Extension
//
//  Created by Kaleb Wijaya on 27/06/19.
//  Copyright © 2019 Kaleb Wijaya. All rights reserved.
//

import Foundation
import CoreMotion
import WatchKit
import os.log
/*
MotionManagerDelegate` exists to inform delegates of motion changes.
These contexts can be used to enable application specific behavior.
 */
protocol MotionManagerDelegate: class {
    func didUpdateMotion(_ manager: MotionManager, gravityStr: String, rotationRateStr: String, userAccelStr: String, attitudeStr: String)
}

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
}

class MotionManager {
    // MARK: Properties
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    let wristLocationIsLeft = WKInterfaceDevice.current().wristLocation == .left
    
    // MARK: Application Specific Constants
    
    let sampleInterval = 1.0 / 60
    let rateAlongGravityBuffer = RunningBuffer(size: 60)
    
    weak var delegate: MotionManagerDelegate?
    
    var gravityStr = ""
    var rotationRateStr = ""
    var userAccelStr = ""
    var attitudeStr = ""
    
    var recentDetection = false
    
    // MARK: Initialization
    
    init() {
        // Serial queue for sample handling and calculations.
        queue.maxConcurrentOperationCount = 1
        queue.name = "MotionManagerQueue"
    }
    
    // MARK: Motion Manager
    
    func startUpdates() {
        if !motionManager.isDeviceMotionAvailable {
            print("Device Motion is not available.")
            return
        }
        
        os_log("Start Updates");
        
        motionManager.deviceMotionUpdateInterval = sampleInterval
        motionManager.showsDeviceMovementDisplay = true
        motionManager.startDeviceMotionUpdates(to: queue) { (deviceMotion: CMDeviceMotion?, error: Error?) in
            if error != nil {
                print("Encountered error: \(error!)")
            }
            
            if deviceMotion != nil {
                self.processDeviceMotion(deviceMotion!)
            }
        }
    }
    
    func stopUpdates() {
        if motionManager.isDeviceMotionAvailable {
            motionManager.stopDeviceMotionUpdates()
        }
    }
    
    // MARK: Motion Processing
    
    func processDeviceMotion(_ deviceMotion: CMDeviceMotion) {
        gravityStr = String(format: "X: %.3f Y: %.3f Z: %.3f" ,
                            deviceMotion.gravity.x,
                            deviceMotion.gravity.y,
                            deviceMotion.gravity.z)
        userAccelStr = String(format: "X: %.3f Y: %.3f Z: %.3f" ,
                              deviceMotion.userAcceleration.x,
                              deviceMotion.userAcceleration.y,
                              deviceMotion.userAcceleration.z)
        rotationRateStr = String(format: "X: %.3f Y: %.3f Z: %.3f" ,
                                 deviceMotion.rotationRate.x,
                                 deviceMotion.rotationRate.y,
                                 deviceMotion.rotationRate.z)
        attitudeStr = String(format: "r: %.3f p: %.3f y: %.3f" ,
                             deviceMotion.attitude.roll,
                             deviceMotion.attitude.pitch,
                             deviceMotion.attitude.yaw)
        
        let timestamp = Date().millisecondsSince1970
        
        os_log("Motion: %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@",
               String(timestamp),
               String(deviceMotion.gravity.x),
               String(deviceMotion.gravity.y),
               String(deviceMotion.gravity.z),
               String(deviceMotion.userAcceleration.x),
               String(deviceMotion.userAcceleration.y),
               String(deviceMotion.userAcceleration.z),
               String(deviceMotion.rotationRate.x),
               String(deviceMotion.rotationRate.y),
               String(deviceMotion.rotationRate.z),
               String(deviceMotion.attitude.roll),
               String(deviceMotion.attitude.pitch),
               String(deviceMotion.attitude.yaw))
        
        updateMetricsDelegate();
    }
    
    // MARK: Data and Delegate Management
    
    func updateMetricsDelegate() {
        delegate?.didUpdateMotion(self,gravityStr:gravityStr, rotationRateStr: rotationRateStr, userAccelStr: userAccelStr, attitudeStr: attitudeStr)
    }
}
