//
//  StatisticButton.swift
//  MC2-Statistic
//
//  Created by Henri Lie Jaya on 12/07/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import UIKit

class StatisticButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        layer.cornerRadius = 5
        backgroundColor = .white
    }

}
