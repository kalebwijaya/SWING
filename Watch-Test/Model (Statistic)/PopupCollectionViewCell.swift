//
//  PopupCollectionViewCell.swift
//  MC2-Statistic
//
//  Created by Henri Lie Jaya on 15/07/19.
//  Copyright © 2019 Henri Lie Jaya. All rights reserved.
//

import UIKit

class PopupCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var popupNumberLabel: UILabel!
    
    @IBOutlet weak var swingTitleLabel: UILabel!
    @IBOutlet weak var scoreTitleLabel: UILabel!
    
    @IBOutlet weak var swingDivider: UIImageView!
    @IBOutlet weak var scoreDivider: UIImageView!
    
    @IBOutlet weak var swingFirstIndicator: UIImageView!
    @IBOutlet weak var swingSecondIndicator: UIImageView!
    
    @IBOutlet weak var swingFirstScore: UILabel!
    @IBOutlet weak var swingSecondScore: UILabel!
}
