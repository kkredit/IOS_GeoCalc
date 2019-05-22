//
//  GeoCalcButton.swift
//  GeoCalc
//
//  Created by Kevin Kredit on 5/21/19.
//  Copyright © 2019 GVSU. All rights reserved.
//

import UIKit

class GeoCalcButton: UIButton {
    
    override func awakeFromNib() {

        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0

        self.backgroundColor = FOREGROUND_COLOR
        self.setTitleColor(BACKGROUND_COLOR, for: .normal)
    }
}
