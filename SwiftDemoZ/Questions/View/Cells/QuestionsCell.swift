//
//  QuestionsCell.swift
//  SwiftDemoZ
//
//  Created by Jhonny on 10/29/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation
import UIKit

class QuestionsCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .black
        }
    }
    
    @IBOutlet weak var radioBtn: UIButton! {
        didSet {
            radioBtn.setImage(UIImage(named: "checked-radio-button"), for: .normal)
        }
    }
}

