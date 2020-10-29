//
//  CustomTableViewHeader.swift
//  SwiftDemoZ
//
//  Created by Jhonny on 10/29/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewHeader: UIView  {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var questionLabel: UILabel! {
        didSet {
            questionLabel.numberOfLines = 10
        }
    }
    
    var cornerRadius: CGFloat = 10.0 {
           didSet {
               layer.cornerRadius = cornerRadius
           }
       }
    
    var questionString: String? {
        get { return questionLabel?.text }
        set { questionLabel.text = newValue }
    }

     override init(frame: CGRect) {
           super.init(frame: frame)
           renderUI()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           renderUI()
       }
    
    func renderUI() {
        let nib = String(describing: CustomTableViewHeader.self)
        
        Bundle.main.loadNibNamed(nib, owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
}
