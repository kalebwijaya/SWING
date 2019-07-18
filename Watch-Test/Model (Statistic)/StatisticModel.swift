//
//  StatisticModel.swift
//  MC2-Statistic
//
//  Created by Henri Lie Jaya on 12/07/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import Foundation

class StatisticModel {
    
    var titleData = ["Total Game","Total Strike", "Right Handling", "Wrong Handling"]
    var valueNumberData = [["5","40","15","25"],["51","40","15","25"],["3","3","3","3"],["4","4","4","4"],["4","4","4","4"]]
    
    var collectionNumber            = ["1","2","3","4","5","6","7","8","9","10"]
    
    var collectionFirstIndicator    = ["Right","Wrong","Right","Wrong","Wrong","Wrong","Wrong","Right","Right","Right"]
    var collectionSecondIndicator   = ["","Wrong","Wrong","Right","Right","Right","Right","Right","Right","Right"]
    
    var collectionFirstScore        = ["10","1","8","0","3","2","1","7","6","5"]
    var collectionSecondScore       = ["","2","0","7","7","7","8","2","4","4"]
    
    var array  : [[String]] = []
    
    func getData(Index : Int) -> [Statistic]{
        array = valueNumberData
        
        
        var game = Int()
        var strike = Int()
        var rightHandling = Int()
        var wrongHandling = Int()
        
        
        for i in valueNumberData{
            for j in 0...i.count{
                if j == 0{
                    game += Int(i[j])!
                } else if j == 1{
                    strike += Int(i[j])!
                } else if j == 2{
                    rightHandling += Int(i[j])!
                } else if j == 3{
                    wrongHandling += Int(i[j])!
                }
            }
        }
        
        var arraydata : [String]
        
        if Index > 4{
            arraydata = [String(game),String(strike),String(rightHandling),String(wrongHandling)]
        }else{
           arraydata = array[Index]
        }
        
        var dataStatistic = [Statistic]()
       
        
        for i in 0..<titleData.count{
            dataStatistic.append(Statistic(titleStatistic: titleData[i], valueNumberStatistic: arraydata[i]))
        }
        return dataStatistic
        
    }
    
    
    
}
