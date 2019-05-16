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
        guard let p1Lat = p1LatInput,let p2Lat = p2LatInput,let p1LongInput = p1LongInput,p2Long = p2LongInput,
          !p1Lat.isEmpty, !p2Lat.isEmpty, !p1Long.isEmpty, !p2Long.isEmpty else {
            return "Cannot be blank"
    }
        
        //set two cordinates points to constants
        let p1 = CLLocation(p1Lat, p1Long)
        let p2 = CLLocation(p2Lat, p2Long)
       
        
      //calculte distance between cordinates in meters.
       let distanceInMeters = p1.distance(from: p2)
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        // clear text fields and reset outlets
    }
}

