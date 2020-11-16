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
    
    @IBOutlet weak var radioImg: UIImageView! {
        didSet {
            radioImg.image = UIImage(named: "unchecked-radio-button")
        }
    }
    
    func handleRadioButton(selectedIndex: Int, indexPath: Int) {
        let imageName = selectedIndex == indexPath ? "checked-radio-button" : "unchecked-radio-button"
        radioImg.image = UIImage(named: imageName)
    }
}

