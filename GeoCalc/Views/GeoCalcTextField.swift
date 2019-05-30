//
//  GeoCalcTextField.swift
//  GeoCalc
//
//  Created by Kevin Kredit on 5/21/19.
//  Copyright © 2019 GVSU. All rights reserved.
//

import UIKit

class GeoCalcTextField: DecimalMinusTextField {

    override func awakeFromNib() {
        
        super.awakeFromNib()

        self.tintColor = BACKGROUND_COLOR
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0

        self.textColor = FOREGROUND_COLOR
        self.backgroundColor = UIColor.clear
        self.borderStyle = .roundedRect

        guard let ph = self.placeholder  else {
            return
        }

        self.attributedPlaceholder =
            NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor :
                FOREGROUND_COLOR])
    }
}
