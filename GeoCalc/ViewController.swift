//
//  ViewController.swift
//  GeoCalc
//
//  Created by Kevin Kredit on 5/14/19.
//  Copyright © 2019 GVSU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var distanceText: UILabel!
    @IBOutlet weak var bearingText: UILabel!
    
    @IBOutlet weak var p1LatInput: UITextField!
    @IBOutlet weak var p1LongInput: UITextField!
    @IBOutlet weak var p2LatInput: UITextField!
    @IBOutlet weak var p2LongInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButtonTapped(_ sender: Any) {
        // if have coords in text fields, calculate
    }
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        // clear text fields and reset outlets
    }
}

