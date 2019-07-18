//
//  StatisticChartView.swift
//  MC2-Statistic
//
//  Created by Henri Lie Jaya on 06/07/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import Foundation
import Macaw

class StatisticChartView : MacawView {
    
    static var flagColor = 0
    static let lastFiveGames            = bowlingData()
    static let maxValue                 = 210
    static let maxValueLineHeight       = 210
    static let lineWidht:Double         = 275
    
    static let dataDivisor              = Double(maxValue/maxValueLineHeight)
    static let adjustData: [Double]     = lastFiveGames.map({ $0.viewCount / dataDivisor })
    static var animations: [Animation]  = []
    
    
    required init?(coder aDecoder:NSCoder) {
        super.init(node: StatisticChartView.createChart(), coder: aDecoder)
        backgroundColor = .clear
    }
    
    private static func createChart() -> Group {
        var items: [Node] = addYAxisItems() + addXAxisItems()
        items.append(createBars())
        
        return Group(contents: items, place: .identity)
    }
    
    private static func addYAxisItems() -> [Node] {
        let maxLines            = 7
        let lineInterval        = Int(maxValue/maxLines)
        let yAxisHeight:Double  = 210
        let lineSpacing:Double  = 30
        
        var newNodes : [Node]    = []
        
        for i in 1...maxLines {
            let y = yAxisHeight - (Double(i) * lineSpacing)
            
            let valueLine = Line(x1: 0, y1: y, x2: lineWidht, y2: y).stroke(fill: Color.white.with(a: 0.10))
            let valueText = Text(text: "\(i * lineInterval)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            valueText.fill = Color.white
            
            newNodes.append(valueLine)
            newNodes.append(valueText)
        }
        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.white.with(a: 0.25))
        newNodes.append(yAxis)
        
        return newNodes
    }
    
    private static func addXAxisItems() -> [Node] {
        let chartBaseY : Double = 210
        var newNodes : [Node] = []
        
//        for i in 0...adjustData.count - 1{
//            let x = (Double(i) * 50+40)
//            let valueText = Text(text: lastFiveGames[i].showNumbers, align: .mid, baseline: .mid, place: .move(dx: x, dy: chartBaseY + 15))
//            valueText.fill = Color.white
//            newNodes.append(valueText)
//        }
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidht, y2: chartBaseY).stroke(fill: Color.white.with(a: 0.25))
        newNodes.append(xAxis)
        
        return newNodes
    }
    
    private static func createBars() -> Group {
        let palette = [0xbf43d8a].map { val in Color(val: val)}
        let items = adjustData.map {_ in Group()}
        
        animations = items.enumerated().map { (i: Int, item: Group) in
            item.contentsVar.animation(delay:0) { t in
                let height  = adjustData[i] * t
                let rect    = Rect( x: Double(i) * 50 + 20, y: 210 - height, w: 30, h: height)
                let flag:Double = i == flagColor ? 1 : 0.29
                let fill = LinearGradient(degree: 90, from: palette[0].with(a: flagColor > items.count ? 1 : flag), to: palette[0].with(a: flagColor > items.count ? 1 : flag))
                return [rect.fill(with: fill)]
            }
        }
        return items.group()
    }

    static func playAnimation() {
        animations.combine().play()
    }

    private static func bowlingData() -> [BowlingStatistic] {
        let gameOne     = BowlingStatistic(showNumbers: "12\nJAN", viewCount: 200)
        let gameTwo     = BowlingStatistic(showNumbers: "22\nFEB", viewCount: 100)
        let gameThree   = BowlingStatistic(showNumbers: "13\nMAR", viewCount: 150)
        let gameFour    = BowlingStatistic(showNumbers: "4\nAPR", viewCount: 90)
        let gameFive    = BowlingStatistic(showNumbers: "5\nMEI", viewCount: 50)
        
        return [gameOne , gameTwo , gameThree , gameFour , gameFive]
    }
}
