//
//  ViewController.swift
//  MC2-Statistic
//
//  Created by Henri Lie Jaya on 06/07/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import UIKit

class StatisticController: UIViewController {
    
    var collectionNumber   = ["1","2","3","4","5","6","7","8","9","10"]
    var handlingData = [["5","40","15","25"],["51","40","15","25"],["3","3","3","3"],["4","4","4","4"],["4","4","4","4"]]
    lazy var statisticModel: StatisticModel = StatisticModel()
    var dataStatistic = [Statistic]()
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
   
    
    @IBOutlet weak var button1Tapped: StatisticButton!
    @IBOutlet weak var button2Tapped: StatisticButton!
    @IBOutlet weak var button3Tapped: StatisticButton!
    @IBOutlet weak var button4Tapped: StatisticButton!
    @IBOutlet weak var button5Tapped: StatisticButton!
    @IBOutlet weak var buttonAllTapped: StatisticButton!
    
    @IBOutlet weak var chartView: UIView!
    
    @IBOutlet weak var handlingView: UIView!
    
    @IBOutlet weak var swingTitle: UILabel!
    
    @IBOutlet weak var rightHandlingTitle: UILabel!
    @IBOutlet weak var wrongHandlingTitle: UILabel!
    
    @IBOutlet weak var rightHandlingCount: UILabel!
    @IBOutlet weak var wrongHandlingCount: UILabel!
    
    @IBOutlet weak var popupButtonOutlet: StatisticButton!
    
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var popupCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)

        loadViewFunc()
        
        button1Tapped.backgroundColor = .white
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        
        button1Tapped.tintColor         = .black
        button2Tapped.tintColor         = .white
        button3Tapped.tintColor         = .white
        button4Tapped.tintColor         = .white
        button5Tapped.tintColor         = .white
        buttonAllTapped.tintColor       = .white
        
        handlingView.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        handlingView.layer.cornerRadius = 20
        
        swingTitle.textColor = .white
        
        rightHandlingTitle.textColor = #colorLiteral(red: 0.3568627451, green: 0.9607843137, blue: 0.7529411765, alpha: 1)
        wrongHandlingTitle.textColor = #colorLiteral(red: 0.9607843137, green: 0.3568627451, blue: 0.3568627451, alpha: 1)
        
        rightHandlingCount.textColor = .white
        rightHandlingCount.textAlignment = .center
        rightHandlingCount.text = statisticModel.valueNumberData[0][2]
        
        wrongHandlingCount.textColor = .white
        wrongHandlingCount.textAlignment = .center
        wrongHandlingCount.text = statisticModel.valueNumberData[0][3]
        
        popupButtonOutlet.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.2392156863, alpha: 1)
        
        popupView.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.2392156863, alpha: 1)
        
        popupCollectionView.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1254901961, blue: 0.2392156863, alpha: 1)
        
        print(popupView.frame)
    }
    
    @IBAction func buttonDay1(_ sender: UIButton) {
        popupButtonOutlet.isHidden = false
        StatisticChartView.flagColor = 0
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = .black
        button2Tapped.tintColor         = .white
        button3Tapped.tintColor         = .white
        button4Tapped.tintColor         = .white
        button5Tapped.tintColor         = .white
        buttonAllTapped.tintColor       = .white
        rightHandlingCount.text = statisticModel.valueNumberData[0][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[0][3]
    }
    
    @IBAction func buttonDay2(_ sender: UIButton) {
        popupButtonOutlet.isHidden = false
        StatisticChartView.flagColor = 1
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = .white
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = .white
        button2Tapped.tintColor         = .black
        button3Tapped.tintColor         = .white
        button4Tapped.tintColor         = .white
        button5Tapped.tintColor         = .white
        buttonAllTapped.tintColor       = .white
        rightHandlingCount.text = statisticModel.valueNumberData[1][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[1][3]
    }
    
    @IBAction func buttonDay3(_ sender: UIButton) {
        popupButtonOutlet.isHidden = false
        StatisticChartView.flagColor = 2
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = .white
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = .white
        button2Tapped.tintColor         = .white
        button3Tapped.tintColor         = .black
        button4Tapped.tintColor         = .white
        button5Tapped.tintColor         = .white
        buttonAllTapped.tintColor       = .white
        rightHandlingCount.text = statisticModel.valueNumberData[2][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[2][3]
    }
    
    @IBAction func buttonDay4(_ sender: UIButton) {
        popupButtonOutlet.isHidden = false
        StatisticChartView.flagColor = 3
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = .white
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = .white
        button2Tapped.tintColor         = .white
        button3Tapped.tintColor         = .white
        button4Tapped.tintColor         = .black
        button5Tapped.tintColor         = .white
        buttonAllTapped.tintColor       = .white
        rightHandlingCount.text = statisticModel.valueNumberData[3][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[3][3]
        
    }
    
    @IBAction func buttonDay5(_ sender: UIButton){
        popupButtonOutlet.isHidden = false
        StatisticChartView.flagColor = 4
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = .white
        buttonAllTapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button1Tapped.tintColor         = .white
        button2Tapped.tintColor         = .white
        button3Tapped.tintColor         = .white
        button4Tapped.tintColor         = .white
        button5Tapped.tintColor         = .black
        buttonAllTapped.tintColor       = .white
        rightHandlingCount.text = statisticModel.valueNumberData[4][2]
        wrongHandlingCount.text = statisticModel.valueNumberData[4][3]
    }
    
    @IBAction func buttonAllDay(_ sender: UIButton) {
        popupButtonOutlet.isHidden = true
        StatisticChartView.flagColor = 6
        loadViewFunc()
        button1Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button2Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button3Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button4Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        button5Tapped.backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.2039215686, alpha: 1)
        buttonAllTapped.backgroundColor = .white
        button1Tapped.tintColor         = .white
        button2Tapped.tintColor         = .white
        button3Tapped.tintColor         = .white
        button4Tapped.tintColor         = .white
        button5Tapped.tintColor         = .white
        buttonAllTapped.tintColor       = .black
        rightHandlingCount.text = String(Int(statisticModel.valueNumberData[0][2])! + Int(statisticModel.valueNumberData[1][2])! + Int(statisticModel.valueNumberData[2][2])! + Int(statisticModel.valueNumberData[3][2])! + Int(statisticModel.valueNumberData[4][2])!)
        
        wrongHandlingCount.text = String(Int(statisticModel.valueNumberData[0][3])! + Int(statisticModel.valueNumberData[1][3])! + Int(statisticModel.valueNumberData[2][3])! + Int(statisticModel.valueNumberData[3][3])! + Int(statisticModel.valueNumberData[4][3])!)
        
        
    }
    
    @IBAction func popupButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, animations: {self.moveUp(view: self.popupView)})
        let blurEffectView = UIVisualEffectView(effect: self.blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
        self.popupView.layer.cornerRadius = 24.0
        self.popupView.center = self.view.center
        
        self.view.addSubview(blurEffectView)
            self.view.addSubview(self.popupView)
    }
    
    @IBAction func donePopoverButton(_ sender: Any) {
        self.popupView.removeFromSuperview()
        let blurView = self.view.subviews[self.view.subviews.count - 1]
        blurView.removeFromSuperview()
    }
    
    func moveUp(view:UIView) {
        view.center.y -= 700
    }
    
    private func loadViewFunc() {
        chartView.contentMode = .scaleAspectFit
        StatisticChartView.playAnimation()
    }


}



extension StatisticController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return statisticModel.collectionNumber.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let popupCell:PopupCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupCard", for: indexPath) as! PopupCollectionViewCell
        
        popupCell.backgroundColor = #colorLiteral(red: 0.137254902, green: 0.137254902, blue: 0.2509803922, alpha: 1)
        popupCell.layer.cornerRadius = 20
        popupCell.swingDivider.image = UIImage(named: "Divider")
        popupCell.scoreDivider.image = UIImage(named: "Divider")
        
        //        popupCell.swingFirstIndicator.textColor     = .white
        //        popupCell.swingSecondIndicator.textColor    = .white
        popupCell.swingFirstScore.textColor         = .white
        popupCell.swingSecondScore.textColor        = .white
        
        popupCell.popupNumberLabel.text = statisticModel.collectionNumber[indexPath.row]
        
        //        popupCell.swingFirstIndicator.text = statisticModel.collectionFirstIndicator[indexPath.row]
        //        popupCell.swingSecondIndicator.text = statisticModel.collectionSecondIndicator[indexPath.row]
        
        popupCell.swingFirstIndicator.image = UIImage(named: statisticModel.collectionFirstIndicator[indexPath.row])
        popupCell.swingSecondIndicator.image = UIImage(named: statisticModel.collectionSecondIndicator[indexPath.row])
        
        popupCell.swingFirstScore.text = statisticModel.collectionFirstScore[indexPath.row]
        popupCell.swingSecondScore.text = statisticModel.collectionSecondScore[indexPath.row]
        
        return popupCell
    }
    
    
}

